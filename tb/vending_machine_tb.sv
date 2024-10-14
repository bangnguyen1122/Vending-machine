module vending_machine_tb;
	logic 	    clk_i_tb, rst_ni_tb;
	logic 	    nickle_i_tb, dime_i_tb, quarter_i_tb;
	logic 	    soda_o_tb;
	logic [2:0] change_o_tb;
	logic [1:0] random;
	logic [7:0] current_state_tb;
	
vending_machine	DUT(
	.clk_i		(clk_i_tb    )
	,.rst_ni	(rst_ni_tb   )
	,.nickle_i	(nickle_i_tb )
	,.dime_i	(dime_i_tb   )
	,.quarter_i	(quarter_i_tb)
	,.soda_o	(soda_o_tb   )
	,.change_o	(change_o_tb )
);

	initial begin
		clk_i_tb = 1'b1;
		#5;
		forever #5 clk_i_tb = ~clk_i_tb;
	end 

	initial begin
		rst_ni_tb = 1'b1;
		#5;
		rst_ni_tb = 1'b0;
		#5;
		rst_ni_tb = 1'b1;
		#2000;
		$finish();
	end
	
	always @(posedge clk_i_tb or negedge rst_ni_tb) begin
		if (!rst_ni_tb) begin
			{nickle_i_tb, dime_i_tb, quarter_i_tb} <= 3'b000;
		end else begin
			random <= $urandom_range(0,3);
			case (random)
				2'b00: {nickle_i_tb, dime_i_tb, quarter_i_tb} <= 3'b000;
				2'b01: {nickle_i_tb, dime_i_tb, quarter_i_tb} <= 3'b001;
				2'b10: {nickle_i_tb, dime_i_tb, quarter_i_tb} <= 3'b010;
				2'b11: {nickle_i_tb, dime_i_tb, quarter_i_tb} <= 3'b100;
			endcase	
		end 
	end 
endmodule 

