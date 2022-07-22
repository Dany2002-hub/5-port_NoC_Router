module route(src, des, direction);
  
  input [3:0]src,des;
  output reg [2:0]direction;
  
  reg [1:0]sx,sy,dx,dy;
  
  always@(src, des)
    begin
      assign sx = src[3:2];
      assign sy = src[1:0];
      assign dx = des[3:2];
      assign dy = des[1:0];
      
      if(dy>sy)
            begin
              direction = 3'b100;    //West Port
            end
      
      else if(dy<sy)
            begin
              direction = 3'b011;   //East Port
            end
      
      else if(dy==sy)
            begin
              
              if(dx>sx)
                begin
                  direction = 3'b010;  //South Port
                end
          
              else if(dx<sx)
                begin
                  direction = 3'b001;  //North Port
                end
              
              else
                begin
                  direction = 3'b000;  //Local Port
           
                end
            end
      
              
    end
endmodule
