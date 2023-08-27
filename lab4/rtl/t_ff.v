module t_ff (t,clk,clr,preset,q);

input t,clk,clr,preset;
output reg q;
//output qb;

always@(posedge clk, negedge clr, negedge preset)//always @(posedge clk,negedge clr, negedge preset)
begin
if (clr == 0)
	q <= 0;
else if (preset == 0)
	q <= 1;	
else if (t == 1)
	q <= ~q;
else 
	q <= q;

/*begin
	if (t == 0)
	q = q;
	else
	q = ~q;
	end*/
end

//assign qb = ~q;
endmodule
