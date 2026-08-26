`include "vending_machine_def.v"

module check_time_and_coin(
    i_input_coin,i_select_item,clk,reset_n,o_return_coin,
    current_total, i_trigger_return, coin_value
);
	input clk;
	input reset_n;
	input i_trigger_return;
	input [`kNumCoins-1:0] i_input_coin;
	input [`kNumItems-1:0]	i_select_item;
	input [`kTotalBits-1:0] current_total;
	input [31:0] coin_value [`kNumCoins-1:0];
	output reg  [`kNumCoins-1:0] o_return_coin;
	reg [`kNumCoins-1:0] prev_input_coin;
	reg [`kNumItems-1:0] prev_select_item;
	reg [31:0] wait_time;
	integer i, remaining;

	// initiate values
	initial begin
		// Initiate values
		o_return_coin = 0;
		wait_time = `kWaitTime;
	end

	always @(*) begin
		// o_return_coin
        remaining = current_total;
        o_return_coin = 0;
        if (wait_time == 0) begin
            for (i = `kNumCoins - 1; i >= 0; i = i - 1) begin
                if (remaining >= coin_value[i]) begin
                    o_return_coin[i] = 1;
                    remaining = remaining - coin_value[i];
                end
            end
        end
	end

	always @(posedge clk) begin
	    prev_input_coin <= i_input_coin;
		prev_select_item <= i_select_item;
		if (!reset_n)
		    wait_time <= `kWaitTime;
		else if (|i_input_coin || |i_select_item || |prev_input_coin || |prev_select_item)
		    wait_time <= `kWaitTime;
		else if (i_trigger_return && wait_time > 2)
		    // RETURN AFTER 3 CYCLE (WHY?????)
		    wait_time <= 2;
		else if (wait_time > 0)
			wait_time <= wait_time - 1;
	end
endmodule 
