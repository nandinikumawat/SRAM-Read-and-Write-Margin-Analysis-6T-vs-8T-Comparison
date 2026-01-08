# SRAM Noise Margin Analysis

## Overview
This project demonstrates static noise margin (SNM) extraction and write margin analysis for 6T and 8T SRAM cells using butterfly curve methodology and load-line analysis in HSPICE. The analysis uses TSMC process technology at VDD = 0.8V and T = 80°C.

## Table of Contents
- [6T SRAM Cell Analysis](#6t-sram-cell-analysis)
- [8T SRAM Cell Analysis](#8t-sram-cell-analysis)
- [Simulation Methodology](#simulation-methodology)
- [Results Summary](#results-summary)

---

## 6T SRAM Cell Analysis

### Circuit Configuration
The standard 6T SRAM cell consists of:
- Two cross-coupled inverters (M1, M2 - PMOS pull-ups; M3, M4 - NMOS pull-downs)
- Two access transistors (M5, M6 - NMOS pass gates)
- Storage nodes: Q and QB
- Control signals: WL (wordline), BL/BLB (bitlines)
- 
<p align="center">
<img width="706" height="434" alt="image" src="https://github.com/user-attachments/assets/3fbf4595-e5a1-45b1-91b6-c3f0f8041d58" />
</p>

### Read Noise Margin (RNM)

**Methodology:**
1. Generate butterfly curves by plotting voltage transfer characteristics (VTC) of both inverters
2. Plot Q vs QB and QB vs Q on the same axes
3. Rotate the combined butterfly curve by 45°
4. Find the maximum square that fits between the two lobes
5. SNM = side length of the largest inscribed square / √2

**Simulation Setup:**
```spice
* HSPICE netlist for 6T SRAM read stability
.PARAM VDD=0.8
.TEMP 80

* Precharge bitlines to VDD
VBL bl 0 VDD
VBLB blb 0 VDD

* Wordline enabled for read
VWL wl 0 VDD

* Cell instance
Xmbh bl blb wl vdd vss q qb SRAM6T

* DC sweep for butterfly curve
.DC V(q) 0 VDD 0.001 V(qb) 0 VDD 0.001
```
<p align="center">
<img width="624" height="468" alt="image" src="https://github.com/user-attachments/assets/d2b688d0-8b14-4703-9c79-2a8d3ee8d31d" />
</p>

**Results:**
- **Maximum vertical distance:** 0.222 V
- **Static Noise Margin (SNM):** 0.157 V
- **Interpretation:** The SNM of 157 mV indicates moderate read stability. Lower SNM values make the cell more vulnerable to noise-induced bit flips during read operations.

### Write Margin (WM)

**Methodology:**
1. Initialize cell to store Q=1, QB=0
2. Assert wordline (WL) to VDD
3. Hold BLB at VDD (writing 0 to Q)
4. Ramp BL from VDD down to 0V
5. Monitor when Q and QB become equal (flip condition)
6. Write margin = VBL at flip point
<p align="center">
<img width="701" height="518" alt="image" src="https://github.com/user-attachments/assets/2a9f887f-1b9c-4c83-ac5b-9b5d6ec47066" />
</p>

**Simulation Setup:**
```spice
* Precharge & stimuli
VWL wl 0 PWL(0 0 1n 0 1.5n VDD)
VBLB blb 0 VDD
VBL bl 0 PWL(0 VDD 1.5n VDD 11.5n 0)

* Cell instance
Xmbh bl blb wl vdd vss q qb SRAM6T

* Detect flip point
.IC V(q)=VDD V(qb)=0
EVDIFF vdiff 0 q qb 1

* Measure write trip point
.MEASURE TRAN t_flip WHEN V(vdiff)=0 CROSS=1
.MEASURE TRAN VBL_at_flip FIND V(bl) AT=t_flip

* Run transient analysis
.TRAN 1p 15n
```

**Results:**
- **Flip time:** 8.6884 ns
- **BL voltage at flip:** 0.2249 V
- **Write Margin:** 0.2249 V at VDD = 0.8V, T = 80°C
- **Interpretation:** Lower write margin indicates easier writability but reduced noise immunity during write operations.

---

## 8T SRAM Cell Analysis

### Circuit Configuration
The 8T SRAM cell extends the 6T design with:
- Standard 6T storage core (M1-M6)
- Isolated read port: Two additional transistors (M7, M8)
- Separate read wordline (RWL) and read bitline (RBL)
- Write operation uses WL, BL, BLB (same as 6T)
- Read operation uses RWL, RBL (isolated from storage nodes)
<p align="center">
<img width="719" height="387" alt="image" src="https://github.com/user-attachments/assets/ebe148f4-a8d2-4739-8943-9879e394699d" />
</p>

**Key Advantage:** Read and write paths are decoupled, eliminating read disturb.

### Read Noise Margin (RNM)

**Methodology:**
Same butterfly curve analysis as 6T cell, but with read port disabled to measure hold stability.

**Simulation Setup:**
```spice
* Disable read port
VRWL rwl 0 0
VRBL rbl 0 VDD

* Write port configuration for hold state
VBL bl 0 VDD
VBLB blb 0 VDD
VWL wl 0 0

* Cell instance
XU bl blb wl rbl rwl vdd vss q qb SRAM8T

* DC sweep for butterfly curve
.DC V(q) 0 VDD 0.001 V(qb) 0 VDD 0.001
```
<p align="center">
<img width="630" height="462" alt="image" src="https://github.com/user-attachments/assets/98a332d4-6015-42e5-b7b3-c9821d31f487" />
</p>

**Results:**
- **Maximum vertical distance:** 0.484 V
- **Static Noise Margin (SNM):** 0.342 V
- **Interpretation:** The 8T cell shows **2.15× improvement** over 6T (0.340V vs 0.157V). This occurs because:
  - Read path is isolated from storage nodes
  - No read disturb degrades the butterfly curve
  - Storage nodes maintain full CMOS inverter characteristics

### Write Margin (WM)

**Methodology:**
Identical to 6T write margin extraction using BL ramp methodology.

**Simulation Setup:**
```spice
* Disable READ port
VRWL rwl 0 0
VRBL rbl 0 VDD

* WRITE port timing (write 0 to Q)
VWWL wwl 0 PWL(0 0 1n 0 1.5n VDD)
VBLB blb 0 VDD
VBL bl 0 PWL(0 VDD 1.5n VDD 11.5n 0)

* Cell instance with pin order matching subcircuit
XU bl blb wwl rbl rwl vdd vss q qb SRAM8T

* Flip detection
.IC V(q)=VDD V(qb)=0
EVDIFF vdiff 0 q qb 1

.MEASURE TRAN t_flip WHEN V(vdiff)=0 CROSS=1
.MEASURE TRAN VBL_at_flip FIND V(bl) AT=t_flip

.TRAN 1p 15n
```

**Results:**
- **Flip time:** 8.6884 ns
- **BL voltage at flip:** 0.2249 V
- **Write Margin:** 0.2249 V at VDD = 0.8V, T = 80°C
- **Interpretation:** Write margin is comparable to 6T since both cells use the same write mechanism. The isolated read port doesn't affect write characteristics.

<p align="center">
<img width="485" height="450" alt="image" src="https://github.com/user-attachments/assets/2ac5fe99-a425-4d1a-98bc-57ff20891d79" />
</p>
---

## Simulation Methodology

### Butterfly Curve Extraction

**Step 1: DC Sweep Setup**
- Sweep both storage nodes (Q and QB) from 0 to VDD
- Step size: 1 mV for smooth curves
- Hold bitlines at VDD, wordline low (hold state)

**Step 2: Data Processing**
- Export V(Q) vs V(QB) curves for both inverter directions
- Import into Python/MATLAB for visualization
- Mirror one curve to create butterfly shape

**Step 3: SNM Calculation**
```python
# Rotate curve by 45 degrees
x_rot = (x - y) / sqrt(2)
y_rot = (x + y) / sqrt(2)

# Find maximum square between lobes
# SNM = side_length / sqrt(2)
```

### Write Margin Extraction

**Step 1: Initial Conditions**
- Set Q=VDD, QB=0 using `.IC` statement
- Ensures known starting state

**Step 2: Write Stimulus**
- Ramp BL from VDD to 0V over 10ns
- Hold BLB at VDD (complementary data)
- Assert WL to enable access transistors

**Step 3: Flip Detection**
- Create auxiliary voltage: Vdiff = V(Q) - V(QB)
- Monitor zero-crossing: when Vdiff = 0, cell has flipped
- Measure BL voltage at this instant

### Simulation Parameters
```spice
.OPTION POST=2 NOMOD MEASFORM=3
.OPTION RELTOL=1e-4 ABSTOL=1e-12
.PROBE TRAN V(bl) V(blb) V(wl) V(q) V(qb) V(vdiff)
```

### Key Insights

**6T SRAM Cell:**
- **Advantages:**
  - Compact layout (minimal area)
  - Simple operation with single wordline
  - Well-characterized across process corners
  
- **Disadvantages:**
  - Read disturb reduces SNM significantly
  - SNM vs. writability tradeoff (cell ratio optimization needed)
  - Lower read stability at low voltages

**8T SRAM Cell:**
- **Advantages:**
  - Superior read stability (2× SNM improvement)
  - No read disturb (isolated read port)
  - Better for low-voltage operation
  - Simplified sizing (no cell ratio constraint)
  
- **Disadvantages:**
  - Larger area (~30% overhead)
  - Additional RWL and RBL routing complexity
  - Slightly higher bitcell pitch

### Design Recommendations

1. **Use 6T for:**
   - High-density applications where area is critical
   - Nominal voltage operation (>0.7V)
   - Cost-sensitive designs

2. **Use 8T for:**
   - Low-voltage SRAM (subthreshold operation)
   - Applications requiring high reliability
   - Designs where read stability is critical
   - Process corners with high Vt variation

---

## Files in Repository

```
├── sram_6t.sp              # 6T SRAM subcircuit netlist
├── sram_8t.sp              # 8T SRAM subcircuit netlist
├── read_snm_6t.sp          # 6T read stability testbench
├── read_snm_8t.sp          # 8T read stability testbench
├── write_margin_6t.sp      # 6T write margin testbench
├── write_margin_8t.sp      # 8T write margin testbench
├── plot_butterfly.py       # Python script for butterfly curve visualization
└── README.md               # This file
```

---

## Running Simulations

### Prerequisites
- HSPICE (tested with version 2019.03)
- TSMC process files (16nm FinFET or equivalent)
- Python 3.x with numpy, matplotlib (for visualization)

### Execution Steps

**1. Run HSPICE Simulations**
```bash
hspice read_snm_6t.sp > read_snm_6t.log
hspice read_snm_8t.sp > read_snm_8t.log
hspice write_margin_6t.sp > write_margin_6t.log
hspice write_margin_8t.sp > write_margin_8t.log
```

**2. Extract Results**
```bash
# View measurements
grep -A 5 "transient analysis" write_margin_6t.log

# Example output:
# t_flip= 8.6884n
# vbl_at_flip= 224.9240m
```

**3. Generate Butterfly Plots**
```bash
python plot_butterfly.py read_snm_6t.tr0
python plot_butterfly.py read_snm_8t.tr0
```

<p align="center">
<img width="590" height="276" alt="image" src="https://github.com/user-attachments/assets/d7a48753-2f94-42ca-87c6-bd398b044573" />
</p>

<p align="center">
<img width="794" height="385" alt="image" src="https://github.com/user-attachments/assets/0fe0163b-2d87-4494-81ee-8620f0a0a615" />
</p>
---

## References

1. E. Seevinck et al., "Static-Noise Margin Analysis of MOS SRAM Cells," IEEE JSSC, 1987
2. K. Takeda et al., "A Read-Static-Noise-Margin-Free SRAM Cell for Low-VDD and High-Speed Applications," IEEE JSSC, 2006
3. B. H. Calhoun and A. P. Chandrakasan, "A 256-kb 65-nm Sub-threshold SRAM Design for Ultra-Low-Voltage Operation," IEEE JSSC, 2007

---

## Author
**Nandini Kumawat**  
Email: kumaw010@umn.edu
