`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2024 04:09:18 PM
// Design Name: 
// Module Name: Alu_dut
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


module Alu_dut();

    reg [3:0] a,b;
    reg [5:0] op;
    wire [3:0] rdo;
    
    localparam DUT_NB_OP = 6;
    localparam DUT_NB_DATA = 4;
    
    ALU 
    #(
        .NB_OP(DUT_NB_OP),
        .NB_DATA(DUT_NB_DATA)
    )uut
    (
        .i_data_a(a),
        .i_data_b(b),
        .i_op(op),
        .o_data(rdo)
        
    );
    
    initial begin
        
        $display("Comienzo de los tests");
        
        a = 4'b0001;
        b = 4'b0001;
        
        op = 6'b0;
        
        #10 $display("Caso 1: a = %b, b = %b, op = %b, rtdo = %b", a, b,op, rdo);
    
    end
endmodule
