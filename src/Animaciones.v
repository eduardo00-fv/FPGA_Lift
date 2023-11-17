module animar(
    input clk,
    input reset,
    input enable_SB,
    input opcion,
    input enable_NUM,
    input [2:0] E,
    
    output [6:0] seg,
    output reg [3:0] an
    );
    
    wire slowclock_1hz_w;
    wire slowclock_100hz_w;
    reg [2:0] scroll;
    reg [3:0] cuarto, tercero, segundo, primero;
    reg [3:0] D;
    reg [1:0] choose;
    
    slow_clk1 U0 (clk, slowclock_1hz_w);
    
    slow_clk_100 U1 (clk, slowclock_100hz_w);
    
    
    
    always @(posedge slowclock_1hz_w or posedge reset)
    
        begin
    
            if (enable_SB)
            begin
                if(reset)
                    begin
                        scroll <= 0;
                        primero = 10;
                        segundo = 10;
                        tercero = 10;
                        cuarto = 10;
                    end
                
                else 
                    begin
                        if (scroll == 4)
                        scroll <= 1;
                        else
                        scroll <= scroll + 1;
                    end
                    
             end
             else
             begin
                
             end
         end
        
    
    always @(posedge slowclock_1hz_w)
        begin
                if (enable_SB)
                begin
                    case (scroll)
                    0:
                    begin
                        if(opcion)
                        
                        begin
                        cuarto = 0;
                        tercero = 1;
                        segundo = 0;
                        primero = 1;
                        end
                        
                        else
                        begin
                        cuarto = 2;
                        tercero = 3;
                        segundo = 2;
                        primero = 3;
                        end
                                              
                        
                    end
                    
                    1: 
                    if(opcion)
                        
                        begin
                        cuarto = 1;
                        tercero = 0;
                        segundo = 1;
                        primero = 0;
                        end
                        
                        else
                        begin
                        cuarto = 3;
                        tercero = 2;
                        segundo = 3;
                        primero = 2;
                        end
                    
                    2:
                    if(opcion)
                        
                        begin
                        cuarto = 0;
                        tercero = 1;
                        segundo = 0;
                        primero = 1;
                        end
                        
                        else
                        begin
                        cuarto = 2;
                        tercero = 3;
                        segundo = 2;
                        primero = 3;
                        end
                    
                    3:
                    if(opcion)
                        
                        begin
                        cuarto = 1;
                        tercero = 0;
                        segundo = 1;
                        primero = 0;
                        end
                        
                        else
                        begin
                        cuarto = 3;
                        tercero = 2;
                        segundo = 3;
                        primero = 2;
                        end
                    
                    4:
                    if(opcion)
                        
                        begin
                        cuarto = 0;
                        tercero = 1;
                        segundo = 0;
                        primero = 1;
                        end
                        
                        else
                        begin
                        cuarto = 2;
                        tercero = 3;
                        segundo = 2;
                        primero = 3;
                        end
                    endcase
                
                
                end
            
                else if (enable_NUM)
                    begin
                        case (E)
                            0: primero = 4;
                            1: primero = 5;
                            2: primero = 6;
                            3: primero = 7;
                            4: primero = 8;
                            5: primero = 9;
                        endcase
                    end
        end
    
    
    
    reg [1:0] count;
    
    
    
    always @(posedge slowclock_100hz_w )
    begin
         if (enable_SB)
         begin 
            count <= count +1;
            
        case (count)
            
            2'b00 :
                begin
                    D = primero;
                    an = 4'b1110;
                end
                
            2'b01 :
                begin
                    D = segundo;
                    an = 4'b1101;
                end
            
            2'b10 :
                begin
                    D = tercero;
                    an = 4'b1011;
                end
            
            2'b11 :
                begin
                    D = cuarto;
                    an = 4'b0111;
                end
        endcase
        
        end
        
        else if (enable_NUM)
            begin
                D = primero;
                an = 4'b1110;
            end
        else
           count <= 0;
        end
       /*     
    always @(posedge slowclock_1hz_w)
    begin
        if (enable_NUM || enable_SB)
            begin
                case (E)
                    3'b000 : 
                        begin
                            D = 4;
                            
                        end
                    3'b001 : 
                        begin
                            D = 5;
                            
                        end
                    3'b010 : 
                        begin
                            D = 6;
                            
                        end
                    3'b011 : 
                        begin
                            D = 7;
                            
                        end
                    3'b100 : 
                        begin
                            D = 8;
                            
                        end
                    3'b101 : 
                        begin
                            D = 9;
                            
                        end
                endcase
            end
    end
    */
    BCD_7 U2 (D, seg); 
     
    
    
    
endmodule