#Termine une éventuelle simulation précédente 
quit -sim

#Supprime le dossier de la librairie riscv
if {[file exists riscv] == 1} {
	file delete -force riscv
}
#Recrée la librairie riscv
vlib riscv		 

#Supprime le dossier de la librairie memory
if {[file exists memory] == 1} {
	file delete -force memory
}
#Recrée la librairie memory
vlib memory		 

#Supprime le dossier de la librairie gpio
if {[file exists gpio] == 1} {
	file delete -force gpio
}
#Recrée la librairie gpio
vlib gpio		 

#Supprime le dossier de la librairie copro
if {[file exists copro] == 1} {
	file delete -force copro
}
#Recrée la librairie copro
vlib copro		 

#Supprime le dossier de la librairie soc
if {[file exists soc] == 1} {
	file delete -force soc
}
#Recrée la librairie soc
vlib soc		 

#Supprime le dossier de la librairie work
if {[file exists work] == 1} {
	file delete -force work
}
#Recrée la librairie work
vlib work		 

#Compile tous les fixhiers du projet
project compileall

#Charge le testbench dan sle simulateur
vsim -voptargs=+acc -debugDB -t 1ps soc.tb_system

#Enregistre TOUS les signaux du système (même ceux non affichés actuellement)
log -r /*

#Mets en forme les chronogrammes
do wave_system.do

#Desactive mes warnings de numeric_std
set NumericStdNoWarnings 1

#Simule pour une certaine durée
run 11 ms