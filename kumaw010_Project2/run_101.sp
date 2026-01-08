.TEMP 80
.OPTION POST
.lib /soft/ece_soft_2/TSMCHOME/Executable_Package/Collaterals/Tech/SPICE/N16ADFP_SPICE_MODEL/n16adfp_spice_model_v1d0_usage.l TTMacro_MOS_MOSCAP

.INCLUDE 101.sp

* Voltage sources
Vy Y 0 PULSE(0 0.8V 100p 10p 10p 80p 180p)
Vdd VDD 0 0.8V
Vss VSS 0 0V

* Small 1fF output capacitance for realistic simulation
C1 Y 0 2fF
.OP
.TRAN 0.1p 2n

.MEASURE TRAN tper TRIG V(Y) VAL=0.4 RISE=1 TARG V(Y) VAL=0.4 RISE=2
.MEASURE TRAN freq PARAM='1/tper'
.MEASURE tran power avg 'frequency*C1*((VDD)^2)'
.MEASURE tran iavg avg I(V2)
.MEASURE tran power param='V(VDD)*iavg'
.MEASURE tran power P(VDD)
.MEASURE tran power avg POWER
