/*module Task2_1(
	input a,
	input b,
	output c
);	
	always_comb begin
		c = a & b; 
	end
endmodule
module Task2_1(
	input clk,
	input d,
	output q
);

always_latch begin
	if (clk) begin
		q <= d;
	end
end
endmodule*/
`include "defines.sv"

module Task2_1(
	input clk,
	input [`DATA_WIDTH-1:0] a,
	input [`DATA_WIDTH-1:0] b,
	input [`DATA_WIDTH-1:0] c,
	output reg [`DATA_WIDTH_OUT-1:0] data_out
);
reg  [`DATA_WIDTH-1:0] q;
	
always_ff @(posedge clk) begin
	q <= c;
	data_out <= a*b+q;
end
endmodule