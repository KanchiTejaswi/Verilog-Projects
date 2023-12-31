/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	dff_tb.v   

Description:	Testbench for DFF

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/

module dff_tb();

// Step 1. Define a parameter with name "cycle" which is equal to 10  
  reg clk,
      reset,
      d;
  wire q,
       qb;
parameter cycle = 10;
// Step 2. Instantiate the d_ff design       
	d_ff d_ff (.clk(clk), .reset(reset),.d(d),.q(q),.qb(qb));
// Step 3. Understand the clock generation logic
  always
  begin
    #(cycle/2);
      clk = 1'b0;
    #(cycle/2);
      clk=~clk;
  end
	  
//Step 4. Understand the various tasks used and also how to use tasks in testbench.
  task rst_dut();
  begin
    reset=1'b1; //@(negedge clk);
    #10; // reset = 1'b1'
    reset=1'b0;//@(negede clk);
  end // reset = 1'b0;end
  endtask

  task din(input i);
  begin
    @(negedge clk);
    d=i;
  end
  endtask
           
  initial 
  begin
    rst_dut;
    din(0);
    din(1);
    din(0);
    din(1);
    din(1);
    rst_dut;
    din(0);
    din(1);
    #10;
    $finish;
  end

//Step5. Use $monitor task in a parallel initial block  to display inputs and outputs.
initial $monitor ("Input clk=%b, reset=%b, d=%b Output q=%b, qb=%b", clk,reset,d,q,qb);

initial #100 $finish;
endmodule