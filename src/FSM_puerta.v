`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2023 12:40:08 PM
// Design Name: 
// Module Name: FSM_puerta
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


module FSM_puerta (
    input clk,         
    input abrir,    
    input cerrar,  
    input bandera_iniciar,
    input alarma,
    output reg [1:0] estado_puerta,   
    output reg LED_alarma,
    output reg LED_sw,
    output reg done
    
);

    reg [3:0] estado;   

    
    // Parámetros de tiempo
    parameter transicion_time = 200_000_000;   // 2 segundos abriendo o cerrando puerta
    parameter abierto_time = 600_000_000;            // 6 segundos puerta abierta


    // Parámetros de estado
    parameter abriendo_puerta = 4'b0001;   
    parameter puerta_abierta = 4'b0010;     
    parameter cerrando_puerta = 4'b0100; 
    parameter puerta_cerrada = 4'b1000; 


    // Función de contador 
    
    reg rst;                 // Señal de rst para el módulo contador
    wire [31:0] count;          // Salida del módulo contador
    
    
    //Variables internas
    
        
    
    reg led_inicio;
    wire led_trans;
    reg enable_parpadeo; 
    reg encender_led;
    
    reg bandera_ciclo;
    reg indicar;
    
    
    
    //Instancia del módulo parpadeo 
    
    f_led_2s U0(clk, enable_parpadeo, encender_led, led_trans); 
   
    // Instancia del módulo contador       
    contador_1 U1 (clk, rst, count);
  
    
    // Máquina de estados de la puerta 
    
    always @(posedge clk) begin
    
        if (abrir) begin     
            estado <= puerta_abierta;
            rst <= 1;
        end
        
        else if (cerrar) begin     
            estado <= cerrando_puerta;
            rst <= 1;
        end

        
        else begin ///iniciar maquina de estados de la puerta
            case (estado)
                abriendo_puerta:
                    if (count < transicion_time)begin   //Si no se cumple el tiempo de 
                        estado <= abriendo_puerta;
                        rst <= 0;
                        enable_parpadeo <= 1;
                        bandera_ciclo <= 0; 
                        indicar <= 0;
                        end
                    else begin
                        estado <= puerta_abierta;
                        rst <= 1;
                        enable_parpadeo <= 0; 
                    end
                puerta_abierta:
                    if (count < abierto_time)begin  //Condicion de tiempo para estar abierta
                        estado <= puerta_abierta;
                        rst <= 0;
                        encender_led <= 1;
                        enable_parpadeo <= 0; //Apagar parpadeo 
                        end
                    else begin
                        if(alarma)begin
                        estado <= puerta_abierta;
                        encender_led <= 1;
                        enable_parpadeo <= 0; 
                        
                        end
                        else begin 
                        estado <= cerrando_puerta;
                        rst <= 1;
                        encender_led <= 0;
                        
                        end
                        
                    end
                cerrando_puerta:
                    if (count < transicion_time)begin
                        estado <= cerrando_puerta;
                        rst <= 0;
                        enable_parpadeo <= 1;
                        bandera_ciclo <= 1; 
                        indicar <= 0;
                        encender_led <=0;            
                    end
                    else begin
                        estado <= puerta_cerrada;
                        rst <= 1;
                        enable_parpadeo <= 0; //Apagar parpadeo
                        

                    end 
                    
                puerta_cerrada:
                        if(bandera_iniciar)begin
                            if(!bandera_ciclo)begin                       
                                estado <= abriendo_puerta;
                                rst <= 1;
                                enable_parpadeo <= 0; //Apagar parpadeo
                                encender_led <= 0;
                            end
                            else begin
                               estado <= puerta_cerrada; 
                               indicar <= 1;                       
                            end   
                        end
                        else begin
                        bandera_ciclo <= 0;
                        indicar <= 0; 
                        estado <= puerta_cerrada;
                        rst <= 0;
                        end
                default:
                begin 
                    estado <= puerta_cerrada;  
                    bandera_ciclo <= 0;
                    indicar <= 0; 
                end 
                                 
                           
            endcase
        end
    end
    // Control de LEDs según el estado
    always @(estado) begin
        case (estado)
    abriendo_puerta: estado_puerta <= 2'b01;
    puerta_abierta: estado_puerta <= 2'b00;
    cerrando_puerta: estado_puerta <= 2'b10;
    puerta_cerrada: estado_puerta<= 2'b11;
    default: begin 
        estado_puerta <= 2'b11; // Estado predeterminado es todo cerrado
        done <= 0;
    end 
    
    

    endcase
    
    LED_alarma <= alarma; 
    LED_sw <= led_trans;
    done <= indicar;
        
    end
    

    
    

endmodule