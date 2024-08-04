`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 12:26:48
// Design Name: 
// Module Name: TicketingControl
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


module TicketingControl (
    input clk,
    input reset,
    input card_present,
    input [3:0] destination,
    input [7:0] balance,
    output reg ticket_dispensed,
    output reg access_granted,
    output reg [7:0] updated_balance
);

    // Define states using localparam
    localparam IDLE = 3'b000,
               CARD_READ = 3'b001,
               BALANCE_CHECK = 3'b010,
               TICKET_DISPENSE = 3'b011,
               ACCESS_CONTROL = 3'b100;

    // Declare state registers
    reg [2:0] current_state, next_state;

    // Default fare value (can be parameterized or calculated)
    reg [7:0] fare;

    // State transition logic (sequential block)
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state and output logic (combinational block)
    always @(*) begin
        // Default values
        next_state = current_state;
        ticket_dispensed = 0;
        access_granted = 0;
        updated_balance = balance;
        fare = 8'd10; // Assuming a fixed fare of 10 for demonstration

        case (current_state)
            IDLE: begin
                if (card_present)
                    next_state = CARD_READ;
            end

            CARD_READ: begin
                // Assuming card read is successful
                next_state = BALANCE_CHECK;
            end

            BALANCE_CHECK: begin
                if (balance >= fare) begin
                    updated_balance = balance - fare;
                    next_state = TICKET_DISPENSE;
                end else begin
                    next_state = IDLE; // Insufficient balance, return to idle
                end
            end

            TICKET_DISPENSE: begin
                ticket_dispensed = 1;
                next_state = ACCESS_CONTROL;
            end

            ACCESS_CONTROL: begin
                access_granted = 1;
                next_state = IDLE; // Return to idle after access control
            end

            default: next_state = IDLE;
        endcase
    end
endmodule


