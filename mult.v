module mult(e,a,q,s,b,clk,Q);
  input [15:0] b,q;
  output reg [15:0] a,Q;
  output reg s,e;
  integer sc;
  reg [15:0]dum;
  input clk;
  
  localparam s0=0,s1=1,stop=2;
  reg [1:0]machine;
  
  always@(posedge clk) begin
    case(machine)
      s0: begin
      	e=0;
        a=16'b0000000000000000;
        sc=16;
        machine=s1;
        dum=q;
        s=dum[15]^b[15];

      end
      s1: begin
        if(sc!=0) begin
          
        	if(dum[0]==1) begin
      			{e,a}=a+b;
        		{e,a,dum}={e,a,dum}>>1;
      			sc=sc-1;
        	end 
    		else begin
        		{e,a,dum}={e,a,dum}>>1;
      			sc=sc-1;	
   			end
            Q=dum;
        	machine=s1;
        end 
        
        else begin
        	machine=stop;	
        end
      end 
      stop: begin
      	machine=stop;
      end
      default: begin
      	machine=s0;
      end   
    endcase
  end
endmodule 
