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
	input reg [`DATA_WIDTH-1:0] a,
	input reg [`DATA_WIDTH-1:0] b,
	input reg [`DATA_WIDTH-1:0] c,
	output reg [`DATA_WIDTH_OUT:0] data_out
);
reg  [`DATA_WIDTH-1:0] q1;
reg  [`DATA_WIDTH-1:0] q2;
reg  [`DATA_WIDTH_OUT-1:0] temp;

always_ff @(posedge clk) begin
	temp <= a*b;
	q1 <= c;
	q2 <= q1;
	data_out <= temp+q2;
end
endmodule