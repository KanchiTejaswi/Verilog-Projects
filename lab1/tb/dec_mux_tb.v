module dec_mux_tb ();
reg [1:0]b;
reg [3:0]c;
wire x;
integer j,i;
dec_mux DM(.in(b), .d(c), .z(x));
initial
begin
for(j = 0;j<4;j= j+1)
begin
j = b;
for (i = 0;i<16;i=i+10)
begin
i = c;
#10;
end
end
end
endmodule