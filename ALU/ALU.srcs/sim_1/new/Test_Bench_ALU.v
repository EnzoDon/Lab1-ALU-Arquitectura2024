`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FCEFyN - UNC 2024
// Engineer: 
// 
// Create Date: 10.09.2024 11:11:35
// Design Name: 
// Module Name: Test_Bench_ALU
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


module Test_Bench_ALU();

// Parámetros
    parameter NB_OP = 6;
    parameter NB_DATA = 4;

    // Entradas (simuladas)
    reg  [NB_DATA-1:0] i_data_a;
    reg  [NB_DATA-1:0] i_data_b;
    reg  [NB_OP-1:0] i_op;

    // Salida
    wire  [NB_DATA-1:0] o_data;

    // Instanciamos el módulo ALU
    ALU #(.NB_OP(NB_OP), .NB_DATA(NB_DATA)) uut (
        .i_data_a(i_data_a),
        .i_data_b(i_data_b),
        .i_op(i_op),
        .o_data(o_data)
    );

    
    initial begin
        // Iniciamos la simulación
        $display("Iniciando Testbench de ALU...");
        
        // Test 1: Suma (operación por defecto)
        i_data_a = 4'b0010; // 2 en decimal
        i_data_b = 4'b0001; // 1 en decimal
        i_op = 6'b000000;   // Suma (operación por defecto)
        #10;
        $display("Suma: %d + %d = %d", i_data_a, i_data_b, o_data);

        // Test 2: Resta
        i_op = 6'b100010;   // Operación de resta
        #10;
        $display("Resta: %d - %d = %d", i_data_a, i_data_b, o_data);

        // Test 3: AND lógico
        i_op = 6'b100100;   // Operación AND
        #10;
        $display("AND: %b & %b = %b", i_data_a, i_data_b, o_data);

        // Test 4: OR lógico
        i_op = 6'b100101;   // Operación OR
        #10;
        $display("OR: %b | %b = %b", i_data_a, i_data_b, o_data);

        // Test 5: XOR lógico
        i_op = 6'b100110;   // Operación XOR
        #10;
        $display("XOR: %b ^ %b = %b", i_data_a, i_data_b, o_data);

        // Test 6: Shift aritmético a la derecha
        i_op = 6'b000011;   // Operación shift aritmético a la derecha
        #10;
        $display("Shift Aritmético Derecha: %d >>> %d = %d", i_data_a, i_data_b, o_data);

        // Test 7: Shift lógico a la derecha
        i_op = 6'b000010;   // Operación shift lógico a la derecha
        #10;
        $display("Shift Lógico Derecha: %d >> %d = %d", i_data_a, i_data_b, o_data);

        // Test 8: NOR lógico
        i_op = 6'b100111;   // Operación NOR
        #10;
        $display("NOR: ~(%b | %b) = %b", i_data_a, i_data_b, o_data);

        
    end


endmodule
