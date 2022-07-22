module test();
  localparam m=4;
  
  reg clk;
  wire [2:0]direction;
  
  switch_arb
  #(.m(m))
  LUT(.clk(clk), .direction(direction));
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      
      clk=1;
      #500;
      
      
      $finish;
    end
  
initial begin 
  forever begin
  #5 clk = ~clk;
  end
end
endmodule
