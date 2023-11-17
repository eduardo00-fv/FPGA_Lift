module BCD_7(
    input [3:0] Y, 
    output reg [6:0] disp
    );
    
    always @(Y)
    begin
        case (Y)
           
            0: disp = 7'b1110011; // bajar 
            1: disp = 7'b1111100; // bajar
            2: disp = 7'b1101110; // subir
            3: disp = 7'b0011111; // subir
            
            4: disp = 7'b0000001; // cero
            5: disp = 7'b1001111; // uno
            6: disp = 7'b0010010; // dos
            7: disp = 7'b0000110; // tres
            8: disp = 7'b1001100; // cuatro
            9: disp = 7'b0110000; // alarma
            10: disp =  7'b1111111; //OFF
            
            /*
            0: disp = 7'b0000001;
            1: disp = 7'b1001111;
            2: disp = 7'b0010010;
            3: disp = 7'b0000111;
            */
        endcase
    end
endmodule