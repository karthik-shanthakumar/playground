`timescale 1ns / 1ps

/*This is the test bench to the serial to parallel
converter file.

Author	: Karthik S
e-mail id: shp.karthik@gmail.com
*/

module SerToPar_tt;
	reg ser_in;
	reg clk;
	reg reset;
	wire [7:0] par_out;
	SerToPar uut (
		.ser_in(ser_in), 
		.clk(clk), 
		.reset(reset), 
		.par_out(par_out)
	);

	initial begin
		ser_in = 0;
		clk = 0;
		reset = 0;
		#10 reset = 1;
		#10 reset = 0;
	end
	
	always #5 clk = ~clk;
	
	always begin
		#10 ser_in = 0;
		#10 ser_in = 0;
		#10 ser_in = 1;
		#10 ser_in = 1;
		#10 ser_in = 1;
		#10 ser_in = 1;
		#10 ser_in = 0;
		#10 ser_in = 1;
		#10 ser_in = 0;
		#10 ser_in = 1;
		#10 ser_in = 0;
		#10 ser_in = 1;
		#10 ser_in = 0;
		#10 ser_in = 1;
		#10 ser_in = 1;
	end
endmodule
