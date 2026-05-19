onerror {resume}
quietly virtual function -install /tb_system/DUT/CPU0/U0 -env /tb_system/DUT/CPU0/U0 { (enable_PC  ? NPC[31:0] : PC[31:0])} dbgTemp1_PC_1
quietly virtual function -install /tb_system/DUT/CPU0/U0 -env /tb_system/DUT/CPU0/U0 { (reset  ? 32'b00000000000000000000000000000000 : dbgTemp1_PC_1)} dbgTemp1_PC_2
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Controls
add wave -noupdate /tb_system/DUT/reset
add wave -noupdate /tb_system/DUT/clk
add wave -noupdate /tb_system/DUT/enable
add wave -noupdate -divider {CPU0 - Instruction}
add wave -noupdate /tb_system/DUT/CPU0/U0/U0/decoded_inst
add wave -noupdate /tb_system/DUT/CPU0_inst_ARvalid
add wave -noupdate /tb_system/DUT/CPU0_inst_ARready
add wave -noupdate /tb_system/DUT/CPU0/U0/enable_PC
add wave -noupdate /tb_system/DUT/CPU0/U0/PC
add wave -noupdate /tb_system/DUT/CPU0_inst_ARpayld
add wave -noupdate /tb_system/DUT/CPU0/U0/inst
add wave -noupdate /tb_system/DUT/CPU0_inst_Rvalid
add wave -noupdate /tb_system/DUT/CPU0_inst_Rready
add wave -noupdate /tb_system/DUT/CPU0_inst_Rpayld
add wave -noupdate /tb_system/DUT/CPU0_inst_AWvalid
add wave -noupdate /tb_system/DUT/CPU0_inst_AWready
add wave -noupdate /tb_system/DUT/CPU0_inst_AWpayld
add wave -noupdate /tb_system/DUT/CPU0_inst_Wvalid
add wave -noupdate /tb_system/DUT/CPU0_inst_Wready
add wave -noupdate /tb_system/DUT/CPU0_inst_Wpayld
add wave -noupdate /tb_system/DUT/CPU0_inst_Bvalid
add wave -noupdate /tb_system/DUT/CPU0_inst_Bready
add wave -noupdate /tb_system/DUT/CPU0_inst_Bpayld
add wave -noupdate -divider {CPU0 - Data}
add wave -noupdate /tb_system/DUT/CPU0_data_ARvalid
add wave -noupdate /tb_system/DUT/CPU0_data_ARready
add wave -noupdate /tb_system/DUT/CPU0_data_ARpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Rvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Rready
add wave -noupdate /tb_system/DUT/CPU0_data_Rpayld
add wave -noupdate /tb_system/DUT/CPU0_data_AWvalid
add wave -noupdate /tb_system/DUT/CPU0_data_AWready
add wave -noupdate /tb_system/DUT/CPU0_data_AWpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Wvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Wready
add wave -noupdate /tb_system/DUT/CPU0_data_Wpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Bvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Bready
add wave -noupdate /tb_system/DUT/CPU0_data_Bpayld
add wave -noupdate -divider {I0 - ROM - Instructions}
add wave -noupdate /tb_system/DUT/B0_I0_ARvalid
add wave -noupdate /tb_system/DUT/B0_I0_ARready
add wave -noupdate /tb_system/DUT/B0_I0_ARpayld
add wave -noupdate /tb_system/DUT/B0_I0_Rvalid
add wave -noupdate /tb_system/DUT/B0_I0_Rready
add wave -noupdate /tb_system/DUT/B0_I0_Rpayld
add wave -noupdate /tb_system/DUT/B0_I0_AWvalid
add wave -noupdate /tb_system/DUT/B0_I0_AWready
add wave -noupdate /tb_system/DUT/B0_I0_AWpayld
add wave -noupdate /tb_system/DUT/B0_I0_Wvalid
add wave -noupdate /tb_system/DUT/B0_I0_Wready
add wave -noupdate /tb_system/DUT/B0_I0_Wpayld
add wave -noupdate /tb_system/DUT/B0_I0_Bvalid
add wave -noupdate /tb_system/DUT/B0_I0_Bready
add wave -noupdate /tb_system/DUT/B0_I0_Bpayld
add wave -noupdate -divider {CPU0 - Data}
add wave -noupdate /tb_system/DUT/CPU0_data_ARvalid
add wave -noupdate /tb_system/DUT/CPU0_data_ARready
add wave -noupdate /tb_system/DUT/CPU0_data_ARpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Rvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Rready
add wave -noupdate /tb_system/DUT/CPU0_data_Rpayld
add wave -noupdate /tb_system/DUT/CPU0_data_AWvalid
add wave -noupdate /tb_system/DUT/CPU0_data_AWready
add wave -noupdate /tb_system/DUT/CPU0_data_AWpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Wvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Wready
add wave -noupdate /tb_system/DUT/CPU0_data_Wpayld
add wave -noupdate /tb_system/DUT/CPU0_data_Bvalid
add wave -noupdate /tb_system/DUT/CPU0_data_Bready
add wave -noupdate /tb_system/DUT/CPU0_data_Bpayld
add wave -noupdate -divider {D2 - ROM - Data}
add wave -noupdate /tb_system/DUT/B1_D1_ARvalid
add wave -noupdate /tb_system/DUT/B1_D1_ARready
add wave -noupdate /tb_system/DUT/B1_D1_ARpayld
add wave -noupdate /tb_system/DUT/B1_D1_Rvalid
add wave -noupdate /tb_system/DUT/B1_D1_Rready
add wave -noupdate /tb_system/DUT/B1_D1_Rpayld
add wave -noupdate /tb_system/DUT/B1_D1_AWvalid
add wave -noupdate /tb_system/DUT/B1_D1_AWready
add wave -noupdate /tb_system/DUT/B1_D1_AWpayld
add wave -noupdate /tb_system/DUT/B1_D1_Wvalid
add wave -noupdate /tb_system/DUT/B1_D1_Wready
add wave -noupdate /tb_system/DUT/B1_D1_Wpayld
add wave -noupdate /tb_system/DUT/B1_D1_Bvalid
add wave -noupdate /tb_system/DUT/B1_D1_Bready
add wave -noupdate /tb_system/DUT/B1_D1_Bpayld
add wave -noupdate -divider {D2 - RAM - Data}
add wave -noupdate /tb_system/DUT/B1_D2_ARvalid
add wave -noupdate /tb_system/DUT/B1_D2_ARready
add wave -noupdate /tb_system/DUT/B1_D2_ARpayld
add wave -noupdate /tb_system/DUT/B1_D2_Rvalid
add wave -noupdate /tb_system/DUT/B1_D2_Rready
add wave -noupdate /tb_system/DUT/B1_D2_Rpayld
add wave -noupdate /tb_system/DUT/B1_D2_AWvalid
add wave -noupdate /tb_system/DUT/B1_D2_AWready
add wave -noupdate /tb_system/DUT/B1_D2_AWpayld
add wave -noupdate /tb_system/DUT/B1_D2_Wvalid
add wave -noupdate /tb_system/DUT/B1_D2_Wready
add wave -noupdate /tb_system/DUT/B1_D2_Wpayld
add wave -noupdate /tb_system/DUT/B1_D2_Bvalid
add wave -noupdate /tb_system/DUT/B1_D2_Bready
add wave -noupdate /tb_system/DUT/B1_D2_Bpayld
add wave -noupdate -divider {Internals B0}
add wave -noupdate /tb_system/DUT/B0/reset
add wave -noupdate /tb_system/DUT/B0/clk
add wave -noupdate /tb_system/DUT/B0/enable
add wave -noupdate /tb_system/DUT/B0/T_ARvalid
add wave -noupdate /tb_system/DUT/B0/T_ARready
add wave -noupdate /tb_system/DUT/B0/T_ARpayld
add wave -noupdate /tb_system/DUT/B0/T_Rvalid
add wave -noupdate /tb_system/DUT/B0/T_Rready
add wave -noupdate /tb_system/DUT/B0/T_Rpayld
add wave -noupdate /tb_system/DUT/B0/T_AWvalid
add wave -noupdate /tb_system/DUT/B0/T_AWready
add wave -noupdate /tb_system/DUT/B0/T_AWpayld
add wave -noupdate /tb_system/DUT/B0/T_Wvalid
add wave -noupdate /tb_system/DUT/B0/T_Wready
add wave -noupdate /tb_system/DUT/B0/T_Wpayld
add wave -noupdate /tb_system/DUT/B0/T_Bvalid
add wave -noupdate /tb_system/DUT/B0/T_Bready
add wave -noupdate /tb_system/DUT/B0/T_Bpayld
add wave -noupdate /tb_system/DUT/B0/I0_ARvalid
add wave -noupdate /tb_system/DUT/B0/I0_ARready
add wave -noupdate /tb_system/DUT/B0/I0_ARpayld
add wave -noupdate /tb_system/DUT/B0/I0_Rvalid
add wave -noupdate /tb_system/DUT/B0/I0_Rready
add wave -noupdate /tb_system/DUT/B0/I0_Rpayld
add wave -noupdate /tb_system/DUT/B0/I0_AWvalid
add wave -noupdate /tb_system/DUT/B0/I0_AWready
add wave -noupdate /tb_system/DUT/B0/I0_AWpayld
add wave -noupdate /tb_system/DUT/B0/I0_Wvalid
add wave -noupdate /tb_system/DUT/B0/I0_Wready
add wave -noupdate /tb_system/DUT/B0/I0_Wpayld
add wave -noupdate /tb_system/DUT/B0/I0_Bvalid
add wave -noupdate /tb_system/DUT/B0/I0_Bready
add wave -noupdate /tb_system/DUT/B0/I0_Bpayld
add wave -noupdate /tb_system/DUT/B0/segment_tmp
add wave -noupdate /tb_system/DUT/B0/segment_reg
add wave -noupdate /tb_system/DUT/B0/segment
add wave -noupdate /tb_system/DUT/B0/I_ARvalid
add wave -noupdate /tb_system/DUT/B0/I_ARready
add wave -noupdate /tb_system/DUT/B0/I_ARpayld
add wave -noupdate /tb_system/DUT/B0/I_Rvalid
add wave -noupdate /tb_system/DUT/B0/I_Rready
add wave -noupdate /tb_system/DUT/B0/I_Rpayld
add wave -noupdate /tb_system/DUT/B0/I_AWvalid
add wave -noupdate /tb_system/DUT/B0/I_AWready
add wave -noupdate /tb_system/DUT/B0/I_AWpayld
add wave -noupdate /tb_system/DUT/B0/I_Wvalid
add wave -noupdate /tb_system/DUT/B0/I_Wready
add wave -noupdate /tb_system/DUT/B0/I_Wpayld
add wave -noupdate /tb_system/DUT/B0/I_Bvalid
add wave -noupdate /tb_system/DUT/B0/I_Bready
add wave -noupdate /tb_system/DUT/B0/I_Bpayld
add wave -noupdate -divider {Internals I0}
add wave -noupdate /tb_system/DUT/I0/reset
add wave -noupdate /tb_system/DUT/I0/clk
add wave -noupdate /tb_system/DUT/I0/enable
add wave -noupdate /tb_system/DUT/I0/ARvalid
add wave -noupdate /tb_system/DUT/I0/ARready
add wave -noupdate /tb_system/DUT/I0/ARpayld
add wave -noupdate /tb_system/DUT/I0/Rvalid
add wave -noupdate /tb_system/DUT/I0/Rready
add wave -noupdate /tb_system/DUT/I0/Rpayld
add wave -noupdate /tb_system/DUT/I0/AWvalid
add wave -noupdate /tb_system/DUT/I0/AWready
add wave -noupdate /tb_system/DUT/I0/AWpayld
add wave -noupdate /tb_system/DUT/I0/Wvalid
add wave -noupdate /tb_system/DUT/I0/Wready
add wave -noupdate /tb_system/DUT/I0/Wpayld
add wave -noupdate /tb_system/DUT/I0/Bvalid
add wave -noupdate /tb_system/DUT/I0/Bready
add wave -noupdate /tb_system/DUT/I0/Bpayld
add wave -noupdate /tb_system/DUT/I0/pstate
add wave -noupdate -divider {Internals CPU0}
add wave -noupdate /tb_system/DUT/CPU0/reset
add wave -noupdate /tb_system/DUT/CPU0/clk
add wave -noupdate /tb_system/DUT/CPU0/enable
add wave -noupdate /tb_system/DUT/CPU0/iARvalid
add wave -noupdate /tb_system/DUT/CPU0/iARready
add wave -noupdate /tb_system/DUT/CPU0/iARpayld
add wave -noupdate /tb_system/DUT/CPU0/iRvalid
add wave -noupdate /tb_system/DUT/CPU0/iRready
add wave -noupdate /tb_system/DUT/CPU0/iRpayld
add wave -noupdate /tb_system/DUT/CPU0/iAWvalid
add wave -noupdate /tb_system/DUT/CPU0/iAWready
add wave -noupdate /tb_system/DUT/CPU0/iAWpayld
add wave -noupdate /tb_system/DUT/CPU0/iWvalid
add wave -noupdate /tb_system/DUT/CPU0/iWready
add wave -noupdate /tb_system/DUT/CPU0/iWpayld
add wave -noupdate /tb_system/DUT/CPU0/iBvalid
add wave -noupdate /tb_system/DUT/CPU0/iBready
add wave -noupdate /tb_system/DUT/CPU0/iBpayld
add wave -noupdate /tb_system/DUT/CPU0/dARvalid
add wave -noupdate /tb_system/DUT/CPU0/dARready
add wave -noupdate /tb_system/DUT/CPU0/dARpayld
add wave -noupdate /tb_system/DUT/CPU0/dRvalid
add wave -noupdate /tb_system/DUT/CPU0/dRready
add wave -noupdate /tb_system/DUT/CPU0/dRpayld
add wave -noupdate /tb_system/DUT/CPU0/dAWvalid
add wave -noupdate /tb_system/DUT/CPU0/dAWready
add wave -noupdate /tb_system/DUT/CPU0/dAWpayld
add wave -noupdate /tb_system/DUT/CPU0/dWvalid
add wave -noupdate /tb_system/DUT/CPU0/dWready
add wave -noupdate /tb_system/DUT/CPU0/dWpayld
add wave -noupdate /tb_system/DUT/CPU0/dBvalid
add wave -noupdate /tb_system/DUT/CPU0/dBready
add wave -noupdate /tb_system/DUT/CPU0/dBpayld
add wave -noupdate /tb_system/DUT/CPU0/pstate
add wave -noupdate /tb_system/DUT/CPU0/fstate
add wave -noupdate /tb_system/DUT/CPU0/IAddr
add wave -noupdate /tb_system/DUT/CPU0/IR
add wave -noupdate /tb_system/DUT/CPU0/IR_reg
add wave -noupdate /tb_system/DUT/CPU0/DBE
add wave -noupdate /tb_system/DUT/CPU0/DADDR
add wave -noupdate /tb_system/DUT/CPU0/DRead
add wave -noupdate /tb_system/DUT/CPU0/DWrite
add wave -noupdate /tb_system/DUT/CPU0/DData_out
add wave -noupdate /tb_system/DUT/CPU0/DData_in
add wave -noupdate /tb_system/DUT/CPU0/enable_PC
add wave -noupdate /tb_system/DUT/CPU0/enable_RB
add wave -noupdate /tb_system/DUT/CPU0/DReadBusError
add wave -noupdate /tb_system/DUT/CPU0/DWriteBusError
add wave -noupdate -divider {Internals B1}
add wave -noupdate /tb_system/DUT/B1/reset
add wave -noupdate /tb_system/DUT/B1/clk
add wave -noupdate /tb_system/DUT/B1/enable
add wave -noupdate /tb_system/DUT/B1/T_ARvalid
add wave -noupdate /tb_system/DUT/B1/T_ARready
add wave -noupdate /tb_system/DUT/B1/T_ARpayld
add wave -noupdate /tb_system/DUT/B1/T_Rvalid
add wave -noupdate /tb_system/DUT/B1/T_Rready
add wave -noupdate /tb_system/DUT/B1/T_Rpayld
add wave -noupdate /tb_system/DUT/B1/T_AWvalid
add wave -noupdate /tb_system/DUT/B1/T_AWready
add wave -noupdate /tb_system/DUT/B1/T_AWpayld
add wave -noupdate /tb_system/DUT/B1/T_Wvalid
add wave -noupdate /tb_system/DUT/B1/T_Wready
add wave -noupdate /tb_system/DUT/B1/T_Wpayld
add wave -noupdate /tb_system/DUT/B1/T_Bvalid
add wave -noupdate /tb_system/DUT/B1/T_Bready
add wave -noupdate /tb_system/DUT/B1/T_Bpayld
add wave -noupdate /tb_system/DUT/B1/I1_ARvalid
add wave -noupdate /tb_system/DUT/B1/I1_ARready
add wave -noupdate /tb_system/DUT/B1/I1_ARpayld
add wave -noupdate /tb_system/DUT/B1/I1_Rvalid
add wave -noupdate /tb_system/DUT/B1/I1_Rready
add wave -noupdate /tb_system/DUT/B1/I1_Rpayld
add wave -noupdate /tb_system/DUT/B1/I1_AWvalid
add wave -noupdate /tb_system/DUT/B1/I1_AWready
add wave -noupdate /tb_system/DUT/B1/I1_AWpayld
add wave -noupdate /tb_system/DUT/B1/I1_Wvalid
add wave -noupdate /tb_system/DUT/B1/I1_Wready
add wave -noupdate /tb_system/DUT/B1/I1_Wpayld
add wave -noupdate /tb_system/DUT/B1/I1_Bvalid
add wave -noupdate /tb_system/DUT/B1/I1_Bready
add wave -noupdate /tb_system/DUT/B1/I1_Bpayld
add wave -noupdate /tb_system/DUT/B1/I2_ARvalid
add wave -noupdate /tb_system/DUT/B1/I2_ARready
add wave -noupdate /tb_system/DUT/B1/I2_ARpayld
add wave -noupdate /tb_system/DUT/B1/I2_Rvalid
add wave -noupdate /tb_system/DUT/B1/I2_Rready
add wave -noupdate /tb_system/DUT/B1/I2_Rpayld
add wave -noupdate /tb_system/DUT/B1/I2_AWvalid
add wave -noupdate /tb_system/DUT/B1/I2_AWready
add wave -noupdate /tb_system/DUT/B1/I2_AWpayld
add wave -noupdate /tb_system/DUT/B1/I2_Wvalid
add wave -noupdate /tb_system/DUT/B1/I2_Wready
add wave -noupdate /tb_system/DUT/B1/I2_Wpayld
add wave -noupdate /tb_system/DUT/B1/I2_Bvalid
add wave -noupdate /tb_system/DUT/B1/I2_Bready
add wave -noupdate /tb_system/DUT/B1/I2_Bpayld
add wave -noupdate /tb_system/DUT/B1/I3_ARpayld
add wave -noupdate /tb_system/DUT/B1/I3_ARready
add wave -noupdate /tb_system/DUT/B1/I3_ARvalid
add wave -noupdate /tb_system/DUT/B1/I3_AWpayld
add wave -noupdate /tb_system/DUT/B1/I3_AWready
add wave -noupdate /tb_system/DUT/B1/I3_AWvalid
add wave -noupdate /tb_system/DUT/B1/I3_Bpayld
add wave -noupdate /tb_system/DUT/B1/I3_Bready
add wave -noupdate /tb_system/DUT/B1/I3_Bvalid
add wave -noupdate /tb_system/DUT/B1/I3_Rpayld
add wave -noupdate /tb_system/DUT/B1/I3_Rready
add wave -noupdate /tb_system/DUT/B1/I3_Rvalid
add wave -noupdate /tb_system/DUT/B1/I3_Wpayld
add wave -noupdate /tb_system/DUT/B1/I3_Wready
add wave -noupdate /tb_system/DUT/B1/I3_Wvalid
add wave -noupdate /tb_system/DUT/B1/segment_tmp
add wave -noupdate /tb_system/DUT/B1/segment_reg
add wave -noupdate /tb_system/DUT/B1/segment
add wave -noupdate /tb_system/DUT/B1/I_ARvalid
add wave -noupdate /tb_system/DUT/B1/I_ARready
add wave -noupdate /tb_system/DUT/B1/I_ARpayld
add wave -noupdate /tb_system/DUT/B1/I_Rvalid
add wave -noupdate /tb_system/DUT/B1/I_Rready
add wave -noupdate /tb_system/DUT/B1/I_Rpayld
add wave -noupdate /tb_system/DUT/B1/I_AWvalid
add wave -noupdate /tb_system/DUT/B1/I_AWready
add wave -noupdate /tb_system/DUT/B1/I_AWpayld
add wave -noupdate /tb_system/DUT/B1/I_Wvalid
add wave -noupdate /tb_system/DUT/B1/I_Wready
add wave -noupdate /tb_system/DUT/B1/I_Wpayld
add wave -noupdate /tb_system/DUT/B1/I_Bvalid
add wave -noupdate /tb_system/DUT/B1/I_Bready
add wave -noupdate /tb_system/DUT/B1/I_Bpayld
add wave -noupdate -divider Risc-V
add wave -noupdate /tb_system/DUT/CPU0/U0/PC_START_ADDRESS
add wave -noupdate /tb_system/DUT/CPU0/U0/reset
add wave -noupdate /tb_system/DUT/CPU0/U0/clk
add wave -noupdate /tb_system/DUT/CPU0/U0/enable_PC
add wave -noupdate /tb_system/DUT/CPU0/U0/enable_RB
add wave -noupdate /tb_system/DUT/CPU0/U0/IAddr
add wave -noupdate /tb_system/DUT/CPU0/U0/IData
add wave -noupdate /tb_system/DUT/CPU0/U0/DBE
add wave -noupdate /tb_system/DUT/CPU0/U0/DAddr
add wave -noupdate /tb_system/DUT/CPU0/U0/DRead
add wave -noupdate /tb_system/DUT/CPU0/U0/DWrite
add wave -noupdate /tb_system/DUT/CPU0/U0/DData_out
add wave -noupdate /tb_system/DUT/CPU0/U0/DData_in
add wave -noupdate /tb_system/DUT/CPU0/U0/decoded_inst
add wave -noupdate /tb_system/DUT/CPU0/U0/PC
add wave -noupdate /tb_system/DUT/CPU0/U0/NPC
add wave -noupdate /tb_system/DUT/CPU0/U0/inst
add wave -noupdate /tb_system/DUT/CPU0/U0/rs1a
add wave -noupdate /tb_system/DUT/CPU0/U0/rs1d
add wave -noupdate /tb_system/DUT/CPU0/U0/rs2a
add wave -noupdate /tb_system/DUT/CPU0/U0/rs2d
add wave -noupdate /tb_system/DUT/CPU0/U0/rda
add wave -noupdate /tb_system/DUT/CPU0/U0/rdd
add wave -noupdate /tb_system/DUT/CPU0/U0/rdd_select
add wave -noupdate /tb_system/DUT/CPU0/U0/immI
add wave -noupdate /tb_system/DUT/CPU0/U0/immS
add wave -noupdate /tb_system/DUT/CPU0/U0/immB
add wave -noupdate /tb_system/DUT/CPU0/U0/immU
add wave -noupdate /tb_system/DUT/CPU0/U0/immJ
add wave -noupdate /tb_system/DUT/CPU0/U0/reg_write
add wave -noupdate /tb_system/DUT/CPU0/U0/PCrs1d_select
add wave -noupdate /tb_system/DUT/CPU0/U0/PCrs1d
add wave -noupdate /tb_system/DUT/CPU0/U0/imm4BJI_select
add wave -noupdate /tb_system/DUT/CPU0/U0/imm4BJI
add wave -noupdate /tb_system/DUT/CPU0/U0/A_select
add wave -noupdate /tb_system/DUT/CPU0/U0/A
add wave -noupdate /tb_system/DUT/CPU0/U0/B_select
add wave -noupdate /tb_system/DUT/CPU0/U0/B
add wave -noupdate /tb_system/DUT/CPU0/U0/op
add wave -noupdate /tb_system/DUT/CPU0/U0/C
add wave -noupdate /tb_system/DUT/CPU0/U0/BE
add wave -noupdate /tb_system/DUT/CPU0/U0/data_out
add wave -noupdate /tb_system/DUT/CPU0/U0/data_in
add wave -noupdate /tb_system/DUT/CPU0/U0/data_in1
add wave -noupdate /tb_system/DUT/CPU0/U0/addr
add wave -noupdate /tb_system/DUT/CPU0/U0/result
add wave -noupdate /tb_system/DUT/CPU0/U0/data_read
add wave -noupdate /tb_system/DUT/CPU0/U0/data_write
add wave -noupdate /tb_system/DUT/CPU0/U0/dbgTemp1_PC_1
add wave -noupdate /tb_system/DUT/CPU0/U0/dbgTemp1_PC_2
add wave -noupdate -divider RegBank
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/reset
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/clk
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/enable
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/wr
add wave -noupdate -radix unsigned /tb_system/DUT/CPU0/U0/U2/address_in
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/data_in
add wave -noupdate -radix unsigned /tb_system/DUT/CPU0/U0/U2/address_out1
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/data_out1
add wave -noupdate -radix unsigned /tb_system/DUT/CPU0/U0/U2/address_out2
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/data_out2
add wave -noupdate /tb_system/DUT/CPU0/U0/U2/tab
add wave -noupdate -divider {Internals D2}
add wave -noupdate /tb_system/DUT/D2/reset
add wave -noupdate /tb_system/DUT/D2/clk
add wave -noupdate /tb_system/DUT/D2/enable
add wave -noupdate /tb_system/DUT/D2/ARvalid
add wave -noupdate /tb_system/DUT/D2/ARready
add wave -noupdate /tb_system/DUT/D2/ARpayld
add wave -noupdate /tb_system/DUT/D2/Rvalid
add wave -noupdate /tb_system/DUT/D2/Rready
add wave -noupdate /tb_system/DUT/D2/Rpayld
add wave -noupdate /tb_system/DUT/D2/AWvalid
add wave -noupdate /tb_system/DUT/D2/AWready
add wave -noupdate /tb_system/DUT/D2/AWpayld
add wave -noupdate /tb_system/DUT/D2/Wvalid
add wave -noupdate /tb_system/DUT/D2/Wready
add wave -noupdate /tb_system/DUT/D2/Wpayld
add wave -noupdate /tb_system/DUT/D2/Bvalid
add wave -noupdate /tb_system/DUT/D2/Bready
add wave -noupdate /tb_system/DUT/D2/Bpayld
add wave -noupdate /tb_system/DUT/D2/pstateR
add wave -noupdate /tb_system/DUT/D2/fstateR
add wave -noupdate /tb_system/DUT/D2/pstateW
add wave -noupdate /tb_system/DUT/D2/fstateW
add wave -noupdate /tb_system/DUT/D2/RnW
add wave -noupdate /tb_system/DUT/D2/address
add wave -noupdate /tb_system/DUT/D2/address_reg
add wave -noupdate /tb_system/DUT/D2/BE
add wave -noupdate -divider {Internals D3}
add wave -noupdate /tb_system/DUT/D3/reset
add wave -noupdate /tb_system/DUT/D3/clk
add wave -noupdate /tb_system/DUT/D3/enable
add wave -noupdate /tb_system/DUT/D3/ARvalid
add wave -noupdate /tb_system/DUT/D3/ARready
add wave -noupdate /tb_system/DUT/D3/ARpayld
add wave -noupdate /tb_system/DUT/D3/Rvalid
add wave -noupdate /tb_system/DUT/D3/Rready
add wave -noupdate /tb_system/DUT/D3/Rpayld
add wave -noupdate /tb_system/DUT/D3/AWvalid
add wave -noupdate /tb_system/DUT/D3/AWready
add wave -noupdate /tb_system/DUT/D3/AWpayld
add wave -noupdate /tb_system/DUT/D3/Wvalid
add wave -noupdate /tb_system/DUT/D3/Wready
add wave -noupdate /tb_system/DUT/D3/Wpayld
add wave -noupdate /tb_system/DUT/D3/Bvalid
add wave -noupdate /tb_system/DUT/D3/Bready
add wave -noupdate /tb_system/DUT/D3/Bpayld
add wave -noupdate /tb_system/DUT/D3/pstateR
add wave -noupdate /tb_system/DUT/D3/fstateR
add wave -noupdate /tb_system/DUT/D3/pstateW
add wave -noupdate /tb_system/DUT/D3/fstateW
add wave -noupdate -divider UART
add wave -noupdate /tb_system/DUT/D3/reset
add wave -noupdate /tb_system/DUT/D3/clk
add wave -noupdate /tb_system/DUT/D3/enable
add wave -noupdate -group Reception /tb_system/DUT/D3/ARvalid
add wave -noupdate -group Reception /tb_system/DUT/D3/ARready
add wave -noupdate -group Reception /tb_system/DUT/D3/ARpayld
add wave -noupdate -group Reception /tb_system/DUT/D3/Rvalid
add wave -noupdate -group Reception /tb_system/DUT/D3/Rready
add wave -noupdate -group Reception /tb_system/DUT/D3/Rpayld
add wave -noupdate -group Reception /tb_system/DUT/D3/pstateR
add wave -noupdate -group Reception /tb_system/DUT/D3/rx_valid
add wave -noupdate -group Reception /tb_system/DUT/D3/rx_ready
add wave -noupdate -group Reception /tb_system/DUT/D3/rx_data
add wave -noupdate -group Reception /tb_system/DUT/D3/RX
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/AWvalid
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/AWready
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/AWpayld
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Wvalid
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Wready
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Wpayld
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Bvalid
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Bready
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/Bpayld
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/pstateW
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/tx_valid
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/tx_ready
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/tx_data
add wave -noupdate -expand -group Transmission /tb_system/DUT/D3/TX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {346798 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 136
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
WaveRestoreZoom {0 ps} {11550 us}
