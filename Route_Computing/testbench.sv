module tb();
  
  reg [3:0]src,des;
  wire [2:0]direction;
  
  route LUT(src, des, direction);
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
    
    src=4'b1100;
    des=4'b1111;
    #10;
    
    $finish;
  end
endmodule
