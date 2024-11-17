# Program 1: 
### Statement: Write an assembly program to encode a number using Hamming code.

### Name of file:
PES2UG22EC028_Hamming.md

### Observation - Explanation
	1.	The program loads a 4-bit binary number from memory and extracts its individual bits (b3, b2, b1, b0).
	2.	It computes the parity bits (p1, p2, p3) based on the Hamming(7,4) encoding rules.
	3.	The program combines the parity and data bits into a 7-bit Hamming code and stores the result in memory.
### Observation - Single Cycle
	•	Cycles: 32 
	•	Frequency: 50 MHz 
	•	CPI: 1 
	•	IPC: 1 

### Observation - 5 Stage
	•	Cycles: 32 
	•	Frequency: 50 MHz 
	•	CPI: 1 
	•	IPC: 1 

### Memory Mapping
input	: 0b1011
output : 0b0111011

### Register Mapping
x10 : 0x10000004
x11 : 0x00000001
x12 : 0x00000001
x13 : 0x00000001
x14 : 0x00000000
x15 : 0x00000001
x16 : 0x00000000
x17 : 0x00000001
x18 : 0x00000001
x19 : 0x0000003b


### Snapshot
<img width="1440" alt="Screenshot 2024-11-16 at 10 56 33" src="https://github.com/user-attachments/assets/2971216f-34e1-4dc1-b26b-37195fc5f3df">
