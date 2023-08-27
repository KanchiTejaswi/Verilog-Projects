/*module decoder_tb();

reg a_in0, a_in1;
wire y_out0, y_out1,y_out2,y_out3;

integer i;

decoder D1 (.a_in0(a_in0), .a_in1(a_in1), .y_out0(y_out0), .y_out1(y_out1),.y_out2(y_out2), .y_out3(y_out3));

initial
begin
a_in0 = 1'b0 ;
a_in1 = 1'b0;
end

initial
begin
	for (i = 0; i<4; i=i+1)
	begin
		{a_in1,a_in0} = i+1;
		#10;
	end
end

initial $monitor ("Input a_in0=%b, a_in1 = %b, Output y_out0=%b, y_out1 = %b, y_out2 = %b, y_out3 = %b", a_in0,a_in1, y_out0, y_out1,y_out2,y_out3 );

initial #100 $finish;
endmodule*/

module decoder_tb();

reg a;
wire y[3:0];

integer i;
//wire b;
decoder D (.a_in(a), .y_out(y)); //(.a_in(a), .a_in(a), .y_out(y), .y_out(y), .y_out(y), .y_out(y));

//(.a_in0(a_in0), .a_in1(a_in1), .y_out0(y_out0), .y_out1(y_out1),.y_out2(y_out2), .y_out3(y_out3)); 

//**********compilation error instantiaing the block with bits. searching for resolution if possible************

initial
begin
//a[1:0] = 2'b00 ;
a = 2'b00;
//a[1] = 1'b0;
end

initial
begin
	for (i = 0; i<4; i=i+1)
	begin
		a = i+1;
		#10;
	end
end

initial $monitor ("Input a=%b, Output y[3:0]=%b", a, y[3:0]);

initial #100 $finish;
endmodule