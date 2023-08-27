/*module decoder(a_in0,a_in1,y_out0, y_out1,y_out2,y_out3);

input a_in0, a_in1;
output y_out0, y_out1, y_out2, y_out3;

//wire a [1:0]; 

//initial
//begin

//decoder D1 (.y_out0((!a_in) & (!a_in)), .y_out1((!a_in) & (a_in)), .y_out2((a_in) & (!a_in)), .y_out3( a_in & a_in)) ;

assign y_out0 = ~a_in1 & ~a_in0;
assign y_out1 = ~a_in1 & a_in0;
assign y_out2 = a_in1 & ~a_in0;
assign y_out3 = a_in1 & a_in0;

endmodule*/

/*module dec2_4 (a,b,en,y0,y1,y2,y3);
input a, b, en;
output y0,y1,y2,y3;
assign y0= (~a) & (~b) & en;
assign y1= (~a) & b & en;
assign y2= a & (~ b) & en;
assign y3= a & b & en;
endmodule*/

/*assign y_out[3:0] = (~a_in) & (~a_in);
assign y_out[3:0] = (~a_in) & (a_in);
assign y_out[3:0] = (a_in) & (~a_in);
assign y_out[3:0] = a_in & a_in*/

module decoder(a_in[1:0],y_out[3:0]);

input [1:0]a_in;
output [3:0]y_out;

//decoder D1 (.y_out0((!a_in) & (!a_in)), .y_out1((!a_in) & (a_in)), .y_out2((a_in) & (!a_in)), .y_out3( a_in & a_in)) ;

assign y_out[0] = ~a_in[1] & ~a_in[0];
assign y_out[1] = ~a_in[1] & a_in[0];
assign y_out[2] = a_in[1] & ~a_in[0];
assign y_out[3] = a_in[1] & a_in[0];

endmodule