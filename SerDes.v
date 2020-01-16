`timescale 1ns / 1ps

/*Here I have designed a serial to parallel converter.
It takes in a serial input and converts the same to 8-bit 
parallel output, at a clock rate 8 times slower. Refer to
the attached schematic for a better understanding.

Author	: Karthik S
e-mail id: shp.karthik@gmail.com
*/

module SerToPar(
    input ser_in, clk, reset,
    output reg [7:0] par_out
    );

reg [2:0] position_counter;
reg [7:0] buffer, buffer_in;

wire [7:0] buf_inp, distr_inp;
wire new_cycle = &position_counter;
reg rst;

initial begin
	position_counter = 3'b000;
end

always@(posedge clk) begin
	position_counter <= position_counter + 1;
	rst <= 0;
	buffer_in[position_counter] <= ser_in;
	buffer <= buf_inp;
end

assign distr_inp = buffer_in;
assign buf_inp = rst ? 8'b0 : distr_inp;

always@(posedge reset) begin
	rst = 1;
	position_counter = 3'b000;
end

always@(posedge new_cycle) begin
	par_out <= buffer;
end	

endmodule
