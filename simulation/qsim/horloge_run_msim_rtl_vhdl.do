transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/asus/OneDrive/Bureau/CESI/vhdl/TCompl/Projet/src/cpt_dcpt.vhd}
vcom -93 -work work {C:/Users/asus/OneDrive/Bureau/CESI/vhdl/TCompl/Projet/src/Afficheur_7_seg.vhd}
vcom -93 -work work {C:/Users/asus/OneDrive/Bureau/CESI/vhdl/TCompl/Projet/src/Top_Level.vhd}

