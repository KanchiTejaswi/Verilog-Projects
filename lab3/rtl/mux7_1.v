module mux7_1(mux_in,sel,mux_out);

input [6:0]mux_in;
input [2:0]sel;
output reg mux_out;

always@(mux_in,sel)
begin
case (sel)
3'b000 : mux_out = mux_in[0];
3'b001 : mux_out = mux_in[1];
3'b010 : mux_out = mux_in[2];
3'b011 : mux_out = mux_in[3];
3'b100 : mux_out = mux_in[4];
3'b101 : mux_out = mux_in[5];
3'b110 : mux_out = mux_in[6];
default : mux_out = 7'bx;
endcase
end
endmodule  