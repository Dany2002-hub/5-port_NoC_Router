module Fifo_buffer#(parameter n=4)
  (clk, RD, WR, data, out, emp, full);
  
  input clk, RD, WR;
  input [15:0] data;
  output reg [15:0] out;
  output emp, full;
  reg [15:0] buffer [0:n];
  reg [2:0] read_count = 0;
  reg [2:0] write_count = 0;
  reg [2:0] count = 0;
  
  assign emp = (count == 0)? 1'b1:1'b0;
  assign full = (count == n+1)? 1'b1:1'b0;
  
  always@(posedge clk)
    begin
      if(WR == 1'b1 && RD == 1'b0)
        begin
          read_count = 0;
          if(count< n+1)
            begin
              buffer[write_count] = data;
              write_count = write_count + 1;
              count = count + 1;
            end
        end
      else if(WR == 1'b0 && RD == 1'b1)
        begin
          write_count = 0;
          if(count > 0)
            begin
              out = buffer[read_count];
              read_count = read_count +1;
              count = count - 1;
            end
        end
    end
endmodule
