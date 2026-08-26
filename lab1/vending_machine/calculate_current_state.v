
`include "vending_machine_def.v"
	

module calculate_current_state(
    i_input_coin, i_select_item, item_price, coin_value, 
    current_total, current_total_nxt, o_return_coin,
    o_available_item, o_output_item
);

	input [`kNumCoins-1:0] i_input_coin, o_return_coin;
	input [`kNumItems-1:0]	i_select_item;			
	input [31:0] item_price [`kNumItems-1:0];
	input [31:0] coin_value [`kNumCoins-1:0];	
	input [`kTotalBits-1:0] current_total;
	output reg [`kNumItems-1:0] o_available_item, o_output_item;
	output reg [`kTotalBits-1:0] current_total_nxt;
	reg  [`kTotalBits-1:0] input_total, output_total, return_total;
	integer i, j;	

	
	// Combinational logic for the next states
	always @(*) begin
		input_total = 0;
		for (i = 0; i < `kNumCoins; i = i + 1)
		    input_total = input_total + i_input_coin[i] * coin_value[i];
		return_total = 0;
		for (i = 0; i < `kNumCoins; i = i + 1)
		    return_total = return_total + o_return_coin[i] * coin_value[i];
		output_total = 0;
		for (i = 0; i < `kNumItems; i = i + 1)
		    output_total = output_total + o_output_item[i] * item_price[i];
						
		current_total_nxt = current_total + input_total - output_total - return_total;
	end

	
	
	// Combinational logic for the outputs
	always @(*) begin
		for (j = 0; j < `kNumItems; j = j + 1) begin
		    o_available_item[j] = (current_total >= item_price[j]) ? 1 : 0;
		    o_output_item[j] = (i_select_item[j] && o_available_item[j]) ? 1 : 0;
		end
	end
 
	


endmodule 
