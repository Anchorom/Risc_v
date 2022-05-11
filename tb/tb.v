module tb;
	reg clk;
	reg rst;
	
	
	always #10 clk = ~clk;
	initial begin
		clk <= 1'b1;
		rst <= 1'b0;
		
		#30;
		rst <= 1'b1;
	end
	
	//rom 初始
	initial begin
		$readmemb("inst_date_ADD.txt",tb.open_risc_v_soc_inst.rom_inst.rom_mem);
	end
	
	
	initial begin
		while(1)begin
			@(posedge clk)
			$display("x27 value is %d",tb.open_risc_v_soc_inst.open_risc_v_inst.regs_inst.regs[27]);
			$display("x28 value is %d",tb.open_risc_v_soc_inst.open_risc_v_inst.regs_inst.regs[28]);
			$display("x29 value is %d",tb.open_risc_v_soc_inst.open_risc_v_inst.regs_inst.regs[29]);
			$display("--------------------------");
			$display("--------------------------");
		end
	end

	open_risc_v_soc open_risc_v_soc_inst(
		.clk				(clk),
		.rst                (rst)
	);


endmodule