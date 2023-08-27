/********************************************************************************************

Copyright 2018-2019 - Maven Silicon Softech Pvt Ltd. All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is considered a trade secret and is not to be divulged or used by parties who 
have not received written authorization from Maven Silicon Softech Pvt Ltd.

Maven Silicon Softech Pvt Ltd
Bangalore - 560076

Webpage: www.maven-silicon.com

Filename:	dff.v   

Description:	Delay flip flop 

Date:		01/05/2018

Author:		Maven Silicon

Email:		online@maven-silicon.com
		 

Version:	1.0

*********************************************************************************************/
 
module d_ff(clk,
           reset,
           d,
           q,
           qb);

 // Step1 : Declare Port Directions
input d,clk,reset;
output reg q;
output qb;
//output qb;

 // Step2 : Write the behavioral logic for D flip-flop functionality.
always@ (posedge clk)// or reset)
	begin
	//d = 1'b0;
	if (reset)// == 1 )
	q = 0;
else //if (reset == 0)
	q = d;
 // Step3: Assign complement of q to qb.
	end
assign	qb = ~ q;
	//end
endmodule