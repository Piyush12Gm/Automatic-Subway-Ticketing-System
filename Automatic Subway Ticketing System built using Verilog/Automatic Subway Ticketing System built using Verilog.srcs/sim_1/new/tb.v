`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2024 12:36:36
// Design Name: 
// Module Name: tb
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


module TicketingControl_tb;

    // Inputs
    reg clk;
    reg reset;
    reg card_present;
    reg [3:0] destination;
    reg [7:0] balance;

    // Outputs
    wire ticket_dispensed;
    wire access_granted;
    wire [7:0] updated_balance;

    // Instantiate the Unit Under Test (UUT)
    TicketingControl uut (
        .clk(clk),
        .reset(reset),
        .card_present(card_present),
        .destination(destination),
        .balance(balance),
        .ticket_dispensed(ticket_dispensed),
        .access_granted(access_granted),
        .updated_balance(updated_balance)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;
        card_present = 0;
        destination = 4'b0000; // Destination input, unused in current example
        balance = 8'd0;

        // Reset the system
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Test Case 1: Sufficient balance
        balance = 8'd50;      // Initial balance
        card_present = 1;     // Card is presented
        #20 card_present = 0; // Remove card

        // Wait for the FSM to process
        #50;

        // Test Case 2: Insufficient balance
        reset = 1;
        #10 reset = 0;
        balance = 8'd5;       // Insufficient balance
        card_present = 1;     // Card is presented
        #20 card_present = 0; // Remove card

        // Wait for the FSM to process
        #50;

        // Test Case 3: Exact balance
        reset = 1;
        #10 reset = 0;
        balance = 8'd10;      // Exact balance for the fare
        card_present = 1;     // Card is presented
        #20 card_present = 0; // Remove card

        // Wait for the FSM to process
        #50;

        // End simulation
        $finish;
    end

endmodule

