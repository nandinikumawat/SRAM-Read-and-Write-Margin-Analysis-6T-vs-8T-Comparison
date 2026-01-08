** Generated for: hspiceD
** Generated on: Oct  1 11:36:59 2025
** Design library name: ee8310
** Design cell name: ringOsci101
** Design view name: schematic

** Library name: ee8310
** Cell name: inv
** View name: schematic
.subckt inv vdd vss vin vout
xm0 vout vin vdd vdd pch_svt_mac l=16e-9 nfin=1 w=10e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
xm1 vout vin vss vss nch_svt_mac l=16e-9 nfin=1 w=10e-9 multi=1 nf=1 sa=90e-9 sb=90e-9
.ends inv
** End of subcircuit definition.

** Library name: ee8310
** Cell name: ringOsci101
** View name: schematic
xi<1> vdd vss y out<1> inv
xi<2> vdd vss out<1> out<2> inv
xi<3> vdd vss out<2> out<3> inv
xi<4> vdd vss out<3> out<4> inv
xi<5> vdd vss out<4> out<5> inv
xi<6> vdd vss out<5> out<6> inv
xi<7> vdd vss out<6> out<7> inv
xi<8> vdd vss out<7> out<8> inv
xi<9> vdd vss out<8> out<9> inv
xi<10> vdd vss out<9> out<10> inv
xi<11> vdd vss out<10> out<11> inv
xi<12> vdd vss out<11> out<12> inv
xi<13> vdd vss out<12> out<13> inv
xi<14> vdd vss out<13> out<14> inv
xi<15> vdd vss out<14> out<15> inv
xi<16> vdd vss out<15> out<16> inv
xi<17> vdd vss out<16> out<17> inv
xi<18> vdd vss out<17> out<18> inv
xi<19> vdd vss out<18> out<19> inv
xi<20> vdd vss out<19> out<20> inv
xi<21> vdd vss out<20> out<21> inv
xi<22> vdd vss out<21> out<22> inv
xi<23> vdd vss out<22> out<23> inv
xi<24> vdd vss out<23> out<24> inv
xi<25> vdd vss out<24> out<25> inv
xi<26> vdd vss out<25> out<26> inv
xi<27> vdd vss out<26> out<27> inv
xi<28> vdd vss out<27> out<28> inv
xi<29> vdd vss out<28> out<29> inv
xi<30> vdd vss out<29> out<30> inv
xi<31> vdd vss out<30> out<31> inv
xi<32> vdd vss out<31> out<32> inv
xi<33> vdd vss out<32> out<33> inv
xi<34> vdd vss out<33> out<34> inv
xi<35> vdd vss out<34> out<35> inv
xi<36> vdd vss out<35> out<36> inv
xi<37> vdd vss out<36> out<37> inv
xi<38> vdd vss out<37> out<38> inv
xi<39> vdd vss out<38> out<39> inv
xi<40> vdd vss out<39> out<40> inv
xi<41> vdd vss out<40> out<41> inv
xi<42> vdd vss out<41> out<42> inv
xi<43> vdd vss out<42> out<43> inv
xi<44> vdd vss out<43> out<44> inv
xi<45> vdd vss out<44> out<45> inv
xi<46> vdd vss out<45> out<46> inv
xi<47> vdd vss out<46> out<47> inv
xi<48> vdd vss out<47> out<48> inv
xi<49> vdd vss out<48> out<49> inv
xi<50> vdd vss out<49> out<50> inv
xi<51> vdd vss out<50> out<51> inv
xi<52> vdd vss out<51> out<52> inv
xi<53> vdd vss out<52> out<53> inv
xi<54> vdd vss out<53> out<54> inv
xi<55> vdd vss out<54> out<55> inv
xi<56> vdd vss out<55> out<56> inv
xi<57> vdd vss out<56> out<57> inv
xi<58> vdd vss out<57> out<58> inv
xi<59> vdd vss out<58> out<59> inv
xi<60> vdd vss out<59> out<60> inv
xi<61> vdd vss out<60> out<61> inv
xi<62> vdd vss out<61> out<62> inv
xi<63> vdd vss out<62> out<63> inv
xi<64> vdd vss out<63> out<64> inv
xi<65> vdd vss out<64> out<65> inv
xi<66> vdd vss out<65> out<66> inv
xi<67> vdd vss out<66> out<67> inv
xi<68> vdd vss out<67> out<68> inv
xi<69> vdd vss out<68> out<69> inv
xi<70> vdd vss out<69> out<70> inv
xi<71> vdd vss out<70> out<71> inv
xi<72> vdd vss out<71> out<72> inv
xi<73> vdd vss out<72> out<73> inv
xi<74> vdd vss out<73> out<74> inv
xi<75> vdd vss out<74> out<75> inv
xi<76> vdd vss out<75> out<76> inv
xi<77> vdd vss out<76> out<77> inv
xi<78> vdd vss out<77> out<78> inv
xi<79> vdd vss out<78> out<79> inv
xi<80> vdd vss out<79> out<80> inv
xi<81> vdd vss out<80> out<81> inv
xi<82> vdd vss out<81> out<82> inv
xi<83> vdd vss out<82> out<83> inv
xi<84> vdd vss out<83> out<84> inv
xi<85> vdd vss out<84> out<85> inv
xi<86> vdd vss out<85> out<86> inv
xi<87> vdd vss out<86> out<87> inv
xi<88> vdd vss out<87> out<88> inv
xi<89> vdd vss out<88> out<89> inv
xi<90> vdd vss out<89> out<90> inv
xi<91> vdd vss out<90> out<91> inv
xi<92> vdd vss out<91> out<92> inv
xi<93> vdd vss out<92> out<93> inv
xi<94> vdd vss out<93> out<94> inv
xi<95> vdd vss out<94> out<95> inv
xi<96> vdd vss out<95> out<96> inv
xi<97> vdd vss out<96> out<97> inv
xi<98> vdd vss out<97> out<98> inv
xi<99> vdd vss out<98> out<99> inv
xi<100> vdd vss out<99> out<100> inv
xi<101> vdd vss out<100> y inv
.END
 
