module Task2_1(
	input a,
	input b,
	output c
);	
	always_comb begin
		c = a & b; 
	end
endmodule