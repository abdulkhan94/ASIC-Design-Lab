onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_clk
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_n_rst
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_write_data
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_fifo_empty
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_fifo_full
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_write_enable
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_scl_slave_in
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_scl_master_in
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_scl_master_out
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_sda_slave_out
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_sda_master_in
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_sda_slave_in
add wave -noupdate -radix unsigned /tb_i2c_slave/tb_sda_master_out
add wave -noupdate -radix unsigned /tb_i2c_slave/idle
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/TIMER/FLEX/count_out
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/TIMER/FLEX/rollover_flag
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/TIMER/FLEX/D_state
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/TIMER/FLEX/Q_state
add wave -noupdate -radix unsigned /tb_i2c_slave/DUT/TIMER/FLEX/rolltemp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {9999050 ps} {10000050 ps}
