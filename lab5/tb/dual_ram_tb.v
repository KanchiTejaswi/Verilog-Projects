module dual_ram_tb();

parameter width = 8;
parameter depth = 16;
parameter addr = 4;
parameter cycle = 10;

reg [(width-1):0]data_in;
reg [(addr-1):0]wr_addr,rd_addr;
reg clk,reset,write,read;
wire [(width-1):0]data_out;

dual_ram dr (.data_in(data_in),.wr_addr(wr_addr),.rd_addr(rd_addr),.clk(clk),.write(write),.read(read),.data_out(data_out));

//reg [(width - 1): 0] mem [(depth - 1): 0];

always
	begin
	#(cycle/2);
	clk = 1'b0;
	#(cycle/2);
	clk = ~clk;
	end

task initialize ();
	begin
	{write,read} = 0;// = 1'b0; read = 1'b0;
	end
endtask

task write_in (input [7:0]a,input [3:0]b,input w,r);
	begin
	@(negedge clk)
	write = w;
	read = r;
	wr_addr = b;
	data_in = a;
	end
endtask

task read_out (input [3:0]b,input r,w);
	begin
	@(negedge clk)
	write = w;
	read = r;
	rd_addr = b;
	end
endtask

task rst ();
	begin
	#10;
	end
endtask

initial
	begin
	//initialize;
	rst_t;//delay;
	repeat(10)
	write_in ({$random}%256, {$random}%16,1'b1,1'b0);
	repeat(10)
	read_out({$random}%16,1'b1,1'b0);
	#100 $finish;
	end

endmodule
	
