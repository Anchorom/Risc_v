module regs(
	input wire clk,
	input wire rst,
	//from id
	input wire[4:0] reg1_raddr_i,
	input wire[4:0] reg2_raddr_i,
	
	//to id
	output reg[31:0] reg1_rdate_o,
	output reg[31:0] reg2_rdate_o,
	
	//from ex
	input wire[4:0] reg_waddr_i,
	input wire[31:0]reg_wdate_i,
	input 			reg_wen

);

	reg [31:0] regs [0:31];
	integer i;


	always @(*)begin
		if (rst == 1'b0)
			reg1_rdate_o <= 32'b0;
		else if (reg1_raddr_i ==5'b0)
			reg1_rdate_o <= 32'b0;
		else if (reg_wen && reg1_raddr_i == reg_waddr_i)
			reg1_rdate_o <= reg_wdate_i;
		else
			reg1_rdate_o <= regs [reg1_raddr_i];
	end
	
	
	always @(*)begin
		if(rst == 1'b0)
			reg2_rdate_o <= 32'b0;
		else if (reg1_raddr_i ==5'b0)
			reg2_rdate_o <= 32'b0;
		else if (reg_wen && reg2_raddr_i == reg_waddr_i)
			reg2_rdate_o <= reg_wdate_i;
		else
			reg2_rdate_o <= regs [reg1_raddr_i];
	end
	
	
	always @(posedge clk)begin
		if(rst == 1'b0)begin
			for(i=0;i<=31;i=i+1)begin
				regs[i] <= 32'b0;
			end
		end
		else if(reg_wen && reg_waddr_i != 5'b0)
			regs[reg_waddr_i] <= reg_wdate_i;
	end
	
endmodule