`include "defines.sv"

module Task2_3(
	input clk,
	input [`DATA_WIDTH-1:0] a,
	input [`DATA_WIDTH-1:0] b,
	input [`DATA_WIDTH-1:0] c,
	output [`DATA_WIDTH:0] data_out
);

always_ff @(posedge clk) begin
	data_out = a&b|c;
end
endmodule