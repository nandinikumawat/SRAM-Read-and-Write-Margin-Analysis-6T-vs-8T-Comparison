 ** Generated for: hspiceD
** Generated on: Sep 28 17:14:30 2025
** Design library name: ee8310
** Design cell name: 4Inv
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
** Cell name: 4Inv
** View name: schematic
xi3 vdd vss net23 vout inv
xi2 vdd vss net22 net23 inv
xi1 vdd vss net21 net22 inv
xi0 vdd vss vin net21 inv
.END
