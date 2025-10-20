import package_settings::*;

module v1_filter(
	input wire clk,
	input wire reset,
	input wire [SIZE_ADC_DATA-1:0] input_data,
	output wire [SIZE_FILTER_DATA:0] output_data
);
reg [SIZE_ADC_DATA-1:0] data [DEPTH-1:0];
reg [3:0] cnt;

reg [3:0] i;

reg [SIZE_ADC_DATA:0] d [1:0];

reg [SIZE_ADC_DATA+2:0] p [1:0];
reg [SIZE_ADC_DATA+4:0] r [1:0];
reg [SIZE_ADC_DATA+5:0] Trap [1:0];

reg [SIZE_ADC_DATA+1:0] sh1 [1:0];
reg [SIZE_ADC_DATA+1:0] sh2 [1:0];

always_ff @(posedge clk) 
	begin
		if (~reset) 
		begin
			for(i=0; i<(DEPTH-1);i++)
			begin
				data[i] <= 0;
			end
			cnt <= 0;
		end
		else begin
	//data shift
			for(i=0; i<12; i++)
			begin
				data[i+1] <= data[i];
			end
			data[0] <= input_data;
	//
			
			d[0] <= data[0] - data[5] - data[8] + data[13];
						
			p[0] <= p[0] + d[0];
			r[0] <= p[0] + 16 * sh1[0];
			Trap[0] <= Trap[0] + r[0];
	
			sh1[0] <= d[0];

			output_data <= Trap[0];
		end
	end
endmodule