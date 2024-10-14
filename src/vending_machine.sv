module vending_machine (
	input logic 		clk_i, rst_ni,
	input logic 		nickle_i, dime_i, quarter_i,
	output logic		soda_o,
	output logic [2:0] 	change_o
);

	logic [8:0] current_state, next_state;

	localparam logic [8:0]	S0  = 9'b0_0000_0001,
							S5	= 9'b0_0000_0010,
							S10 = 9'b0_0000_0100,
							S15 = 9'b0_0000_1000,
							S20 = 9'b0_0001_0000,
							S25 = 9'b0_0010_0000,
							S30 = 9'b0_0100_0000,
							S35 = 9'b0_1000_0000,
							S40 = 9'b1_0000_0000;

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if (!rst_ni) current_state <= S0;
		else current_state <= next_state;
	end

	always_comb begin
		case (current_state)
			S0: case ({nickle_i, dime_i, quarter_i})
					3'b100: next_state = S5;
					3'b010: next_state = S10;
					3'b001: next_state = S25;
					default: next_state = S0;
				endcase
			
			S5: case ({nickle_i, dime_i, quarter_i})
					3'b100: next_state = S10;
					3'b010: next_state = S15;
					3'b001: next_state = S30;
					default: next_state = S5;
				endcase
			
			S10: case ({nickle_i, dime_i, quarter_i})
					3'b100: next_state = S15;
					3'b010: next_state = S20;
					3'b001: next_state = S35;
					default: next_state = S10;
				endcase

			S15: case ({nickle_i, dime_i, quarter_i})
					3'b100: next_state = S20;
					3'b010: next_state = S25;
					3'b001: next_state = S40;
					default: next_state = S15;
				endcase

			default: next_state = S0;
		endcase
	end 

	always_comb begin
		case (current_state)
			S20: {soda_o, change_o} = 4'b1000;
			S25: {soda_o, change_o} = 4'b1001;
			S30: {soda_o, change_o} = 4'b1010;
			S35: {soda_o, change_o} = 4'b1011;
			S40: {soda_o, change_o} = 4'b1100;
			default: {soda_o, change_o} = 4'b0000;
		endcase
	end 
	
endmodule 
