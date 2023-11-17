`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 04:29:17 PM
// Design Name: 
// Module Name: f_led_2s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module f_led_2s(
    input clk, enable_inter, enable_fijo, 
    output reg  LED
    );
    
    reg [31:0] contador;
    reg estado;

    always @ (posedge clk)
        begin
            
            
            if (enable_inter)
                begin
                    if (contador == 50_000_000)
                        begin
                            contador <= 0;
                            estado <= ~estado;
                        end
                    else
                        begin
                        contador <= contador + 1;
                        end
                end
            else if (enable_fijo)
                begin
                    contador <= 0;
                    estado <= 1; 
                end
            else 
                begin
                    contador <= 0;
                    estado <= 0;
                end
        end
        
     always @(*)
        begin
            LED <= estado;
        end
        
endmodule
