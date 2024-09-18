`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2024 04:27:16 PM
// Design Name: 
// Module Name: TOP
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


module TOP
#(
    parameter DATA_LEN = 8,
    parameter OP_LEN = 6
)
(
    input wire button_1,
    input wire button_2,
    input wire button_3,
    input wire clock,
    input wire reset,
    input wire [DATA_LEN - 1 : 0] bus,
    
    output wire [DATA_LEN - 1 : 0] led,
    output wire test_led 
);
  
  
  reg signed [DATA_LEN - 1 : 0] reg_data_A;
  reg signed [DATA_LEN - 1 : 0] reg_data_B;
  reg [OP_LEN - 1 : 0] reg_op;
  
  ALU #(
    .NB_OP(OP_LEN),
    .NB_DATA(DATA_LEN)
  )
  alu(
    .i_data_a(reg_data_A),
    .i_data_b(reg_data_B),
    .i_op(reg_op),
    .o_data(led)
  );
  
  always @(posedge clock)
  begin
    if(reset && !button_1 && !button_2 && !button_3)
        begin
            reg_data_A <= {(DATA_LEN) {1'b0}};
            reg_data_B <= {(DATA_LEN) {1'b0}};
            reg_op <= {(DATA_LEN) {1'b0}};
        end
     else if(!reset && button_1 && !button_2 && !button_3)
        reg_data_A <= bus;
     else if(!reset && !button_1 && button_2 && !button_3)
        reg_data_B <= bus;
     else if(!reset && !button_1 && !button_2 && button_3)
        reg_op <= bus;
     else
        begin
            reg_data_A <= reg_data_A;
            reg_data_B <= reg_data_B;
            reg_op <= reg_op;
        end 
  end
  
  
  assign test_led = reset;   
  
    
    
    
    
endmodule
