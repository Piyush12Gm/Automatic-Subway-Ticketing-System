### Automatic-Subway-Ticketing-System


# Objective:
To design a Verilog-based Automatic Subway Ticketing System that can handle ticket dispensing, balance checking, and access control for passengers based on ticket validity.
Key Components and Modules
# Input Interface:
Card Reader Module: Reads the passenger's subway card data, including balance and ticket validity.
Keypad Interface: Allows passengers to enter destination information or other relevant inputs.
# Ticketing Control Unit:
FSM (Finite State Machine): Manages the state transitions for the ticketing process. States could include idle, card read, balance check, ticket dispense, and access granted/denied.
Balance Check Module: Verifies if the passenger has sufficient balance for the selected destination.
# Destination Calculation Module:
Computes the fare based on the entered destination and deducts it from the card balance.
# Display Interface:
LCD/LED Display Module: Displays information such as fare, balance, and ticketing status to the user.
# Ticket Dispensing Unit:
Ticket Dispenser Module: Dispenses the physical ticket after successful payment.
# Access Control Unit:
Access Gate Module: Controls the gate to allow or deny access based on ticket validity.
Gate Control FSM: Manages the opening and closing of the gate.
# Memory Management:
EEPROM/SRAM Module: Stores passenger card data, including balance and transaction history.
Data Interface Module: Handles reading and writing of data to memory.
# Security and Error Handling:
Error Detection Module: Monitors for errors such as card read failure, insufficient balance, or hardware malfunctions.
Security Module: Ensures that unauthorized access attempts are detected and handled appropriately.
Workflow
# Card Scanning:
Passenger scans their card at the entry point.
The system reads the card data and moves to the balance checking state.
# Balance and Fare Calculation:
Passenger inputs their destination.
The system calculates the fare and checks if the balance is sufficient.
If the balance is insufficient, the system displays a message and exits.
Ticket Dispensing:
If the balance is sufficient, the fare is deducted from the balance.
The system moves to the ticket dispensing state and prints a ticket with journey details.
The balance is updated on the card.
# Access Control:
After ticket dispensing, the system checks ticket validity.
The gate opens, allowing the passenger to enter.
# Exit Process:
Similar process at the exit point to deduct the fare for the journey and update the balance.
Advanced Features
Multiple Payment Options: Integrate with other payment methods such as NFC, mobile payments, etc.
Dynamic Fare Calculation: Implement variable fare based on time, distance, or passenger type (e.g., student, senior citizen).
Error Handling and Security: Implement mechanisms to handle card cloning, unauthorized access, or hardware failures.
Data Logging: Store transaction history for audit and reporting purposes.

# Module Explaination
1.Initialization of fare:
I've added a simple initialization for fare. In a real-world scenario, you may calculate this based on the destination input or another module.
2.Removed Unnecessary Comments:
Cleaned up comments to focus on critical parts.
3.Avoided Implicit Signals:
Every signal used in the always @(*) block is now explicitly handled.
4.Default Assignment of next_state:
The state is now correctly transitioned based on the FSM design.
![Screenshot (175)](https://github.com/user-attachments/assets/08bd7b16-bf1d-41b4-a20a-1f29b718721d)

 # Test Bench Explaination
 1. Clock Generation:   The clock signal clk toggles every 5 time units, simulating a 10-unit 
    clock period.
2. Initial Block (Test Scenarios):
   The initial block sets up the test cases and applies inputs to the TicketingControl module.
3. Reset:  The system is reset at the beginning of each test case to ensure a clean start.
    Test Cases:
    Test Case 1: Tests the scenario where the passenger has a sufficient balance.
    Test Case 2: Tests the scenario with insufficient balance.
    Test Case 3: Tests the scenario where the balance is exactly equal to the fare.
4. Outputs:      The testbench monitors ticket_dispensed, access_granted, and updated_balance 
   to verify the correct operation of the FSM.
5. Simulation End:   The simulation ends with $finish after all test cases are run.
 
![Screenshot (176)](https://github.com/user-attachments/assets/d39e0eac-3de1-4f1e-9536-1e5447de4d6f)



