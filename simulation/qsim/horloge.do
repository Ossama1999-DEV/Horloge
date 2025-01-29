onerror {exit -code 1}
vlib work
vlog -work work horloge.vo
vlog -work work Waveform_cpt_dcpt_1.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.cpt_dcpt_vlg_vec_tst -voptargs="+acc"
vcd file -direction horloge.msim.vcd
vcd add -internal cpt_dcpt_vlg_vec_tst/*
vcd add -internal cpt_dcpt_vlg_vec_tst/i1/*
run -all
quit -f
