module dff_set #(//节拍器
	parameter DW = 32
)
(
	input wire 			 clk,
	input wire 			 rst,
	input wire  [DW-1:0] set_date,
	input wire  [DW-1:0] date_i,
	output reg  [DW-1:0] date_o
);


	always @(posedge clk)begin
		if(rst == 1'b0)
			date_o <= set_date;
		else
			date_o <= date_i;
	end


endmodule
