module Task2_2(
	input clk,
	input d,
	output q
);

always_latch begin
	if (clk) begin
		q <= d;
	end
end
endmodule
