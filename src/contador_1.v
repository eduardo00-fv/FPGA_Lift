`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 06:50:45 PM
// Design Name: 
// Module Name: contador_1
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


module contador_1(
    input clk,       
    input rst,     
    output reg [31:0] count 
    );
    
    always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0; // Reiniciar el contador a 0 cuando se activa el rst
    end else begin
        count <= count + 1; // Incrementar el contador en cada ciclo de reloj
    end
end
endmodule
