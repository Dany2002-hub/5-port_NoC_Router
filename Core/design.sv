module core#(parameter n=4)
  (data, clk, src, des, dataout);
  
  input clk;
  input [3:0] src, des;
  input [14*n-9:0] data;
  output reg [15:0]dataout;
  reg [15:0] out[0:n-1];
  reg [2:0] Count=0;
  
assign out[0] = {2'b00, src[3:0], des[3:0], data[14*n-9:14*n-14]};
  genvar i;
   generate
     for(i=1; i<n-1; i=i+1)
       begin
         assign out[i] = {2'b01, data[14*(n-i)-1:14*(n-i)-14]};
       end
   endgenerate
  
  assign out[n-1]={2'b10, data[13:0]};

  always@(posedge clk)
    begin
      if(Count>n-1)
        begin
          dataout<=out[n-1];
          
        end
      else
        begin
          dataout<=out[Count];
          Count<=Count+1;
        end
    end
endmodule
