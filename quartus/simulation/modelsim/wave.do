onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /vending_machine_tb/DUT/clk_i
add wave -noupdate /vending_machine_tb/DUT/rst_ni
add wave -noupdate /vending_machine_tb/DUT/nickle_i
add wave -noupdate /vending_machine_tb/DUT/dime_i
add wave -noupdate /vending_machine_tb/DUT/quarter_i
add wave -noupdate /vending_machine_tb/DUT/soda_o
add wave -noupdate /vending_machine_tb/DUT/change_o
add wave -noupdate /vending_machine_tb/DUT/current_state
add wave -noupdate /vending_machine_tb/DUT/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {99 ps}
