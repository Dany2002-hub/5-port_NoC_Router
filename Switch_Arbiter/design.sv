module switch_arb#(parameter m=4)
  (clk, direction);
  
  input clk;
  output reg [2:0]direction;
  
  reg [2:0]count=0;
  reg [$clog2(m):0]timer=0;
  
  always@(posedge clk)
    begin
      timer = timer +1;
      if(timer < m)
        begin
          if(count==3'b000)
            begin
              direction <= 3'b000;   //Local Port
            end
          else if(count == 3'b001)
            begin
              direction <= 3'b001;   //North Port
            end
          else if(count == 3'b010)
            begin
              direction <= 3'b010;   //South Port
            end
          else if(count == 3'b011)
            begin
              direction <= 3'b011;   //East Port
            end
          else if(count == 3'b100)
            begin
              direction <= 3'b100;   //West Port
            end          
        end
      else if(timer==m)
        begin
          count = count+1;
          timer<=0;
          if(count==5)
            begin
              count<=0;
            end

        end
    end
endmodule
