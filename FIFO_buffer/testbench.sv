module tb();
  localparam n=4;
  
  reg clk, RD, WR;
  reg [15:0] data;
  wire [15:0] out;
  wire emp, full;
  
  Fifo_buffer
  #(.n(n))
  LUT(clk, RD, WR, data, out, emp, full);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    clk = 1;
    WR = 1'b1;
    RD = 1'b0;
    data = 16'h20;
    #10;
    
    data = 16'h127;
    #10;
    
    data = 16'h32;
    #10;
    
    data = 16'h763;
    #10;
    
    data = 16'h98;
    #10;
    
    WR = 1'b0;
    RD = 1'b1;
    #60;
    
    $finsih;
  end
  
  initial begin 
    forever begin
    #5 clk = ~clk;
    end
  end
endmodule
