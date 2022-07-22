module Tb(); 
  localparam n=4;
  
  reg [14*n-9:0]data;
  reg clk;
  reg [3:0]src, des;
  wire [15:0] dataout;
  
  core 
  #(.n(n))
  LUT(.data(data), .clk(clk), .src(src), .des(des), .dataout(dataout));
   
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1); 
    
    clk=1;
    src=4'b1000;
    des=4'b0011;
    data=48'b110110001101011100100110101101110001011101111010;
    #50;
    $finish;

  end


initial begin 
    forever begin
    #5 clk = ~clk;
    end
end
endmodule
