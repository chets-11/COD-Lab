# Program 1: 
### Statement: Write an assembly program to calculate the factorial of a number with & without recursion

### Name of file:


### Observation - Explanation
	•	The program loads the number 5 into register x1 and initializes register x2 to 1 for storing the factorial result.
	•	It uses a loop to multiply the result stored in x2 by x1, then decrements x1 by 1 on each iteration.
	•	The loop continues until x1 reaches 0, after which x2 holds the factorial result (5! = 120).

### Observation - Single Cycle
	•	Cycles: 8
	•	Frequency: 1.0 GHz 
	•	CPI: 1.0 
	•	IPC: 1.0 

### Observation - 5 Stage
	•	Cycles: 15 
	•	Frequency: 1.0 GHz 
	•	CPI: 1.25 
	•	IPC: 0.8 
### Memory Mapping
	•	x1 : 5
	•	x2 : 120

### Register Mapping
	•	x1 : 0x00000000
	•	x2 : 0x00000078

### Snapshot
<img width="1440" alt="Screenshot 2024-11-15 at 22 52 34" src="https://github.com/user-attachments/assets/76899243-8683-4949-a115-40d22d6f7b00">
