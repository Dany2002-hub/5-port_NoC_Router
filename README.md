# 5-port_NoC_Router
This repository contains the Verilog codes of the four main components of a 5-port NoC (Network-on-Chip) Router namely Core, FIFO buffer, Route Computing, and Switch Arbiter. This code was implemented and simulated on EDA Playground. 

# Block Diagram of a 5-port NoC Router

![Untitled Diagram](https://user-images.githubusercontent.com/76448256/198030395-9e42a44c-00c6-4aed-8a6d-1c4c2b87794e.jpg)

The specifications and functionalties of the NoC Router:

1) The NoC router has 5 ports namely Local, East, West, North, South.
2) The Core is an FSM which breaks down the incoming data and generate flits (here of size 16 bits). 
3) The flits are of three types: Head, Body, and Tail flits.
![2022-10-26 (5)](https://user-images.githubusercontent.com/76448256/198037418-d3431bc8-9c73-4637-a003-3fddc72a4aa6.png)

     ![2022-10-26 (6)](https://user-images.githubusercontent.com/76448256/198037469-1a945e8b-ab36-4f50-b24d-8942aacc9aeb.png)

     ![2022-10-26 (7)](https://user-images.githubusercontent.com/76448256/198037528-41d56c63-bbe5-48cb-a042-8418ea509639.png)
4) Here, the "src" and "des" represent the source and destination router respectively.
5) In the Core design code, I have parameterized the number of flits as 'n'.
6) FIFO (First-In-First-Out) Buffer is a read/write memory array that collects the generated flits and reads the flits out in the same order to the Crossbar.
7) The FIFO has k+1 entries (as parameterized in the FIFO design code) with 16 bits wide.
8) The Crossbar will transfer the flits from one FIFO buffer to another on the basis of Route Compute and Switch Arbiter Unit.
9) The Route Compute Unit determines the output port of a flit on the basis of its destination address. I have used XY Routing algorithm.
10) The Switch Arbiter Unit (here the arbitration policy is Round Robin) gives equal amount of clock cycles as priority for each and every FIFO buffer on a circular basis thus effectively balancing the load.
11) In the Switch_Arbiter design code, I have parametrized the number of clock cycles as 'm'.

