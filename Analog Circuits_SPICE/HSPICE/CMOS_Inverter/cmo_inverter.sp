* CMOS Inverter - HSPICE

.option post
.temp 27

.lib "cmos_180nm_models.lib"

* Supply
VDD vdd 0 1.8

* Input
VIN in 0 PULSE(0 1.8 0 1n 1n 10n 20n)

* NMOS
MN out in 0 0 NMOS L=180n W=1u

* PMOS
MP out in vdd vdd PMOS L=180n W=2u

.tran 0.1n 50n
.dc VIN 0 1.8 0.01

.measure tran avg_power AVG P(VDD)

.end
