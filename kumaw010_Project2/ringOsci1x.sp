** Generated for: hspiceD
** Generated on: Oct  1 01:47:17 2025
** Design library name: ee8310
** Design cell name: ringOsci1x
** Design view name: schematic


** Library name: ee8310
** Cell name: inv
** View name: schematic
.subckt inv vdd vss vin vout
xm0 vout vin vdd vdd pch_svt_mac l=16e-9 nfin=8 w=346e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 vout vin vss vss nch_svt_mac l=16e-9 nfin=8 w=346e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv
** End of subcircuit definition.

** Library name: ee8310
** Cell name: ringOsci1x
** View name: schematic
xi0<0> vdd vss y out<0> inv
xi0<1> vdd vss out<0> out<1> inv
xi0<2> vdd vss out<1> out<2> inv
xi0<3> vdd vss out<2> out<3> inv
xi0<4> vdd vss out<3> out<4> inv
xi0<5> vdd vss out<4> out<5> inv
xi0<6> vdd vss out<5> out<6> inv
xi0<7> vdd vss out<6> out<7> inv
xi0<8> vdd vss out<7> out<8> inv
xi0<9> vdd vss out<8> out<9> inv
xi0<10> vdd vss out<9> out<10> inv
xi0<11> vdd vss out<10> out<11> inv
xi0<12> vdd vss out<11> out<12> inv
xi0<13> vdd vss out<12> out<13> inv
xi0<14> vdd vss out<13> y inv
.END

