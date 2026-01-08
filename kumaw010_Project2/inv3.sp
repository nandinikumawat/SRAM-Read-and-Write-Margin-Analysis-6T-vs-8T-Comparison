** Generated for: hspiceD
** Generated on: Sep 28 16:35:32 2025
** Design library name: ee8310
** Design cell name: 3Inv
** Design view name: schematic


** Library name: ee8310
** Cell name: inv
** View name: schematic
.subckt inv vdd vss vin vout
m0 vout vin vdd vdd pch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
m1 vout vin vss vss nch_svt_mac l=16e-9 nfin=4 w=154e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv
** End of subcircuit definition.

** Library name: ee8310
** Cell name: 3Inv
** View name: schematic
xi2 vdd vss net19 vout inv
xi1 vdd vss net18 net19 inv
xi0 vdd vss vin net18 inv
.END

