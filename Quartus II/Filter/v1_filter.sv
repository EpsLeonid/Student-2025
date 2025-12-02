import package_settings_V1::*;
module v1_filter(
	input wire clk,
	input wire reset,
	input wire [SIZE_IN_DATA-1:0] input_data,
	output wire [SIZE_OUT_DATA-1:0] output_data
);
reg [SIZE_IN_DATA-1:0] data [DEPTH-1:0];
reg [SIZE_CNT-1:0] cnt;

reg [SIZE_CNT-1:0] i;

//need resolution =  ...+8 to have same sign bit position

reg [SIZE_IN_DATA+8:0] d;
reg [SIZE_IN_DATA+8:0] sh;//sh - SHIFT FOR ÑORRECT MULTIPLICATION
reg [SIZE_IN_DATA+8:0] p;
reg [SIZE_IN_DATA+8:0] r;
reg [SIZE_IN_DATA+8:0] Trap;

always_ff @(posedge clk) 
	begin
		if (~reset) 
		begin
			for(i=0; i<(DEPTH-1);i++)
			begin
				data[i] <= 0;
			end
			d <= 0;
			p <= 0;
			r <= 0;
			Trap <= 0;

			cnt <= 0;
		end
		else begin
	//data shift
			for(i=0; i<DEPTH-1; i++)
			begin
				data[i+1] <= data[i];
			end
			data[0] <= input_data;

			d <= data[0] - data[k] - data[l] + data[k+l];

			sh <= d;

			p <= p + d;
			r <= p + M * sh;
			Trap <= Trap + r;

			output_data <= Trap[SIZE_IN_DATA+8:7];
		end
	end
endmodule