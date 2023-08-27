module tff_tb ();
reg t,clk,clr,preset;
wire q;

parameter cycle = 10;

integer i;

t_ff tf(.t(t),.preset(preset),.clr(clr),.clk(clk),.q(q));

always
	begin
	#(cycle/2);
	clk = 1'b0;
	#(cycle/2);
	clk = ~clk;
	end	

task rst();
	begin
	clr = 1'b0;
	#10;
	clr = 1'b1;
	end
endtask

task p_rst();
	begin
	preset = 1'b0;
	#10;
	preset = 1'b1;
	end
endtask

task t_in (input i);
	begin
	@(negedge clk);
	t = i;
	end
endtask

initial
	begin
	rst();
	t_in(0);
	t_in(1);
	t_in(1);
	t_in(0);
	t_in(0);
	t_in(1);
	rst();
	t_in(1);
	t_in(0);
	p_rst();
	#10;
	$finish;
end

initial $monitor ("Input t=%b,clk=%b,clr=%b,preset=%b Ouput q =%b",t,clk,clr,preset,q);

initial #100 $finish;

endmodule
