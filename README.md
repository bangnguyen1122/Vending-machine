# Design of a Vending Machine using SystemVerilog

## 1. Objectives
* Review basic logic design and FSM concepts.
* Design a Vending Machine using System Verilog.

## 2. Problem
Vending Machine is a dispenser machine that receives coins or bills and dispenses soft drinks or snacks. A simple vending machine controller is described in Figure 1.

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Vending-machine%E2%80%99s-ports.png" alt="Figure 1" width="500">
  <br>
  <em>Figure 1: Vending machine’s ports</em>
</p>

Design a vending machine that meets the following specifications:

1. The vending machine is capable of accepting coins: ¢5 (Nickle), ¢10 (Dime), ¢25 (Quarter). However, it should only accept one coin at a time (per clock cycle).

2. When the deposited amount exceeds ¢20,  it should dispense a soda and calculate the correct change.

3. The change is represented as a 3-bit data:
   |     |     |
   |-----|-----|
   | 000 | ¢0  |
   | 001 | ¢5  |
   | 010 | ¢10 |
   | 011 | ¢15 |
   | 100 | ¢20 |

For example, the system accepts a dime and then a quarter as input from the customer. In the subsequent cycle, the system dispenses a soda and provides a change of ¢15.

## 3. Analysis and Design

Based on the design requirements, we proceed to build a state machine for the vending machine based on the Moore structure, and the coins accepted only include ¢5 (Nickle), ¢10 (Dime), and ¢25 (Quarter), with only one coin accepted at a time. Based on the change return mechanism, we observe that there are 9 states corresponding to 9 amounts of money in the machine before dispensing soda and change. Each state will provide soda and change based on the current state of the machine.

### 3.1. Block diagram

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Block-diagram-of-vending-machine.png" alt="Figure 2" width="500">
  <br>
  <em>Figure 2: Block diagram of vending machine</em>
</p>

### 3.2. Describe the problem in detail

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/State-table-for-possible-states-of-a-Moore-state-machine.png" alt="Table 1" width="600">
  <br>
  <em>Table 1: State table for possible states of a Moore state machine</em>
</p>

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Describing-the-ports-on-the-state-machine.png" alt="Table 2" width="600">
  <br>
  <em>Table 2: Describing the ports on the state machine</em>
</p>

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Description-of-the-ports-on-the-state-machine.png" alt="Table 3" width="600">
  <br>
  <em>Table 3: Description of the ports on the state machine</em>
</p>

### 3.3.	State Transition Table

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/The-state-transition-table-of-the-state-machine.png" alt="Table 4" width="600">
  <br>
  <em>Table 4: The state transition table of the state machine</em>
</p>

### 3.4. State Transition Diagram

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Finite-State-Machine.png" alt="Figure 3" width="800">
  <br>
  <em>Figure 3: Finite State Machine</em>
</p>

This Finite State Machine (FSM) represents a vending machine that accepts nickels (¢5), dimes (¢10), and quarters (¢25) to dispense soda when the total inserted amount reaches or exceeds ¢20. The machine has several states labeled S0 to S40, where the number indicates the cumulative amount inserted in cents. At each state, the user can insert one of the three coins, transitioning the machine to a new state based on the amount. When the state reaches S20 or beyond, the machine dispenses a soda (soda = 1) and returns the correct change if the inserted amount exceeds ¢20 (change = {¢0, ¢5, ¢10, ¢15, ¢20}).

For example, if the state is S25, the machine dispenses a soda and returns ¢5 in change. If the state is S40, it dispenses a soda and returns ¢20. This FSM ensures that only one soda is dispensed per transaction and handles change appropriately.

### 3.5. Waveform

Observing the simulation waveform, we can see that when the signal rst_ni = 0, the input signals nickle_i, dime_i, and quarter_i all have a value of 0. When the signal rst_ni = 1, these input signals are randomly assigned values (0 or 1) on each rising edge of the clock. Only one of the three signals has a value of 1, while the other two signals have a value of 0. At the same time, the next state (next_state) is updated from the current state (current_state) according to the designed FSM.
In conclusion, based on the simulation waveform, it can be confirmed that the vending machine design meets all the specified design requirements.

<p align="center">
  <img src="https://github.com/bangnguyen1122/Vending-machine/blob/main/doc/images/Waveform-on-ModelSim.png" alt="Figure 4" width="900">
  <br>
  <em>Figure 4: Waveform on ModelSim</em>
</p>


