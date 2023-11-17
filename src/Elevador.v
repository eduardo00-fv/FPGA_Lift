module ascensor ( //version 4
  input wire clk,          // Reloj de 100 MHz
  input wire reset,        // Reinicio asincrónico
  input wire boton_piso_1, // Botón para ir al piso 1
  input wire boton_piso_2, // Botón para ir al piso 2
  input wire boton_piso_3, // Botón para ir al piso 3
  input wire boton_piso_4, // Botón para ir al piso 4
  input wire boton_piso_5, // Botón para ir al piso 5
  input wire boton_subir_1, // Botón para llamar al piso 1
  input wire boton_subir_2, // Botón para llamar al piso 2 (subir)
  input wire boton_bajar_2, // Botón para llamar al piso 2 (bajar)
  input wire boton_bajar_3, // Botón para llamar al piso 3 (bajar)
  input wire boton_subir_3, // Botón para llamar al piso 3 (subir)
  input wire boton_bajar_4,// Botón para llamar al piso 4 (BAJAR)
  input wire boton_subir_4,// Botón para llamar al piso 4 (subir)
  input wire boton_bajar_5,// Botón para llamar al piso 5 (BAJAR)
  input abrir, cerrar, alarma,
  output wire piso1_led,    // Indicador de pisos elevador
  output wire piso2_led,  
  output wire piso3_led,    
  output wire piso4_led,
  output wire piso5_led,
  output wire piso1_up,   // Indicador de pisos subida
  output wire piso2_up,    
  output wire piso3_up,    
  output wire piso4_up,
  output wire piso2_down, // Indicador de pisos bajada 
  output wire piso3_down,    
  output wire piso4_down,
  output wire piso5_down,
  output [6:0] seg,
  output [3:0] an,
  output [1:0] estado_puerta,   
  output LED_alarma,
  output LED_sw,
  output done
);

  // Parámetros de estado
  parameter PISO_1 = 3'b000;
  parameter PISO_2 = 3'b001;
  parameter PISO_3 = 3'b010;
  parameter PISO_4 = 3'b011;
  parameter PISO_5 = 3'b100;
  parameter SUBIENDO = 3'b110;
  parameter BAJANDO = 3'b111;

  ///control de bcd
  reg option,enable_SB,enable_NUM;
  // Registros para mantener el estado actual y el próximo estado
  reg [3:0] current_state, next_state,prev_state;
  reg [31:0] wait_counter;
  // Registros para mantener el estado de cada piso
  reg piso1_state, piso2_state, piso3_state, piso4_state, piso5_state;
  //cola
  reg m1, m2, m3, m4, m5;
  
  wire bandera_inicio;
  wire done_2;

  
  ////modulo instanciado
  animar U0 (clk, rst, enable_SB, option, enable_NUM, current_state, seg, an);

  FSM_puerta U1 (clk, abrir, cerrar, bandera_inicio, alarma, estado_puerta, LED_alarma, LED_sw, done_2);
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      wait_counter <= 0;
      current_state <= PISO_1; // Iniciar en piso 1
      piso1_state <= 1'b1;
      piso2_state <= 1'b0;
      piso3_state <= 1'b0;
      piso4_state <= 1'b0;
      piso5_state <= 1'b0;
    end else begin
      current_state <= next_state;
      wait_counter <= (next_state == current_state) ? wait_counter + 1 : 0;
    end
  end

  always @(posedge clk) begin
    // Lógica de transición de estados
    case (current_state)
      PISO_1, PISO_2, PISO_3, PISO_4, PISO_5: begin
      if (current_state<prev_state)option<=0;
      enable_NUM<=1;
      enable_SB<=0;
      if ((boton_piso_1 || boton_subir_1)&&current_state!=0)m1 <= 1;
      if ((boton_piso_2 || boton_subir_2 || boton_bajar_2)&&current_state!=1)m2 <= 1;
      if ((boton_piso_3 || boton_subir_3 || boton_bajar_3)&&current_state!=2)m3 <= 1;
      if ((boton_piso_4 || boton_subir_4 || boton_bajar_4)&&current_state!=3)m4 <= 1;
      if ((boton_piso_5 || boton_bajar_5)&&current_state!=4)m5 <= 1;
      if ((boton_piso_2 || boton_subir_2 || boton_bajar_2 || m2) && current_state<1 && done_2)begin next_state<=SUBIENDO; m2 <= 1;end
      else if ((boton_piso_3 || boton_subir_3 || boton_bajar_3 || m3) && current_state<2 && done_2 && option==0 )begin next_state<=SUBIENDO; m3 <= 1;end
      else if ((boton_piso_4 || boton_subir_4 || boton_bajar_4 || m4) && current_state<3 && done_2 && option==0)begin next_state<=SUBIENDO; m4 <= 1;end
      else if ((boton_piso_5 || boton_bajar_5 || m5) && current_state<4 && done_2 && option==0)begin next_state<=SUBIENDO; m5 <= 1;end
      else if ((boton_piso_1 || boton_subir_1 || m1) && current_state>0 && done_2)begin next_state<=BAJANDO; m1 <= 1;end
      else if ((boton_piso_2 || boton_subir_2 || boton_bajar_2 || m2) && current_state>1 && done_2)begin next_state<=BAJANDO; m2 <= 1;end
      else if ((boton_piso_3 || boton_subir_3 || boton_bajar_3 || m3) && current_state>2 && done_2)begin next_state<=BAJANDO; m3 <= 1;end
      else if ((boton_piso_4 || boton_subir_4 || boton_bajar_4 || m4) && current_state>3 && done_2)begin next_state<=BAJANDO; m4 <= 1;end
      else  next_state <= current_state ;
            prev_state <= current_state;
      end

      SUBIENDO: begin
      enable_NUM<=0;
      enable_SB<=1;
      option <= 0;
      if (boton_piso_1 || boton_subir_1)m1 <= 1;
      if (boton_piso_2 || boton_subir_2 || boton_bajar_2)m2 <= 1;
      if (boton_piso_3 || boton_subir_3 || boton_bajar_3)m3 <= 1;
      if (boton_piso_4 || boton_subir_4 || boton_bajar_4)m4 <= 1;
      if (boton_piso_5 || boton_bajar_5)m5 <= 1;
      if(wait_counter == 500_000_000)begin
      if(m2 == 1 && prev_state<PISO_2)begin next_state=PISO_2; m2 = 0;end
      else if(m3 == 1 && prev_state<PISO_3)begin next_state=PISO_3; m3 = 0;end
      else if(m4 == 1 && prev_state<PISO_4)begin next_state=PISO_4; m4 = 0;end
      else if(m5 == 1 && prev_state<PISO_5)begin next_state=PISO_5; m5 = 0;end
      end
      
      end
      
      BAJANDO: begin
      if (boton_piso_1 || boton_subir_1)m1 <= 1;
      if (boton_piso_2 || boton_subir_2 || boton_bajar_2)m2 <= 1;
      if (boton_piso_3 || boton_subir_3 || boton_bajar_3)m3 <= 1;
      if (boton_piso_4 || boton_subir_4 || boton_bajar_4)m4 <= 1;
      if (boton_piso_5 || boton_bajar_5)m5 <= 1;
      enable_NUM<=0;
      enable_SB<=1;
      option <= 1;
    if(wait_counter == 500_000_000)begin
      if(m4 == 1 && prev_state>PISO_4)begin next_state=PISO_4; m4 = 0;end
      else if(m3 == 1 && prev_state>PISO_3)begin next_state=PISO_3; m3 = 0;end
      else if(m2 == 1 && prev_state>PISO_2)begin next_state=PISO_2; m2 = 0;end
      else if(m1 == 1 && prev_state>PISO_1)begin next_state=PISO_1; m1 = 0;end
      end
    end
    endcase
    end

  // Salidas
  assign bandera_inicio = !enable_SB;
  assign done = done_2;

  // Indicadores de piso
  assign piso1_led = (m1 == 1);
  assign piso2_led = (m2 == 1);
  assign piso3_led = (m3 == 1);
  assign piso4_led = (m4 == 1);
  assign piso5_led = (m5 == 1);
  
  assign piso1_up = (m1 == 1);
  assign piso2_up = (m2 == 1 && option==0);
  assign piso3_up = (m3 == 1 && option==0);
  assign piso4_up = (m4 == 1 && option==0);
  
  assign piso2_down = (m2 == 1 && option==1);
  assign piso3_down = (m3 == 1 && option==1);
  assign piso4_down = (m4 == 1 && option==1);
  assign piso5_down = (m5 == 1);

endmodule
