# Hybrid Fixed-Priority + Round Robin Arbiter (FPGA Implementation)

This project implements a **Hybrid Arbiter** that supports:
- **Fixed Priority Arbitration** (when `prior = 1`)
- **Round Robin Arbitration** (when `prior = 0`)

It is fully designed in **Verilog HDL**, simulated in **Vivado**, and implemented on the **Basys3 FPGA (Artix-7)** board.

---

## 🚀 Features
- 4-requester arbiter (`req[3:0]`)
- 4 grant outputs (`grant[3:0]`)
- FSM-based Round Robin scheduling
- Fixed-priority override mode using a control signal
- Debounced reset + clock divider for Basys3
- Synthesizable and FPGA-ready design
- Verified using post-synthesis timing simulation

---

## 📌 Modes of Operation

### **1. Fixed Priority Mode (`prior = 1`)**
Priority order:
The highest active request is always granted.

req0 > req1 > req2 > req3

### **2. Round Robin Mode (`prior = 0`)**
Priorities rotate each cycle:

S0 → S1 → S2 → S3 → S0 → ...

Fair scheduling → **no starvation**.

---

## 🧠 FSM States
| State | Meaning | Grant |
|-------|---------|--------|
| `Sidl` | Idle | `0000` |
| `S0` | Grant req0 | `0001` |
| `S1` | Grant req1 | `0010` |
| `S2` | Grant req2 | `0100` |
| `S3` | Grant req3 | `1000` |

---

## 📂 Folder Structure
RoundRobin-Arbiter/
│
├── src/
│ ├── rndrbn.v
│ ├── clk_div.v
│ ├── top_rndrbn.v
│ └── testbench/
│ └── rndrbn_tb.v
│
├── constraints/
│ └── Basys3.xdc
│
├── simulation/
│ ├── post_synth_waveform.png
│ └── analysis.md
│
└── README.md

---

## 🛠️ Basys3 Pin Mapping
| Signal | Basys3 Pin | Component |
|--------|-------------|------------|
| clk | W5 | 100 MHz Oscillator |
| rst | U18 | BTNC |
| prior | V17 | SW4 |
| req[0] | W16 | SW0 |
| req[1] | V16 | SW1 |
| req[2] | W17 | SW2 |
| req[3] | W15 | SW3 |
| grant[0] | U16 | LED0 |
| grant[1] | E19 | LED1 |
| grant[2] | U19 | LED2 |
| grant[3] | V19 | LED3 |

---

## 🧪 Simulation
Post-synthesis simulation validates:
- Arbitration latency  
- Round-robin fairness  
- Priority override correctness  
- Grant stability across FSM transitions  

simulation/post_synth_waveform.png

---

## 📦 Synthesis & Implementation
This design successfully meets timing on:
- **Xilinx Vivado 2020+**
- **Basys3 Artix-7 FPGA**

Ensure:
- `clk` uses FPGA global clock pin (W5)
- You include `clk_div.v` to slow down visual output

---

## ▶️ Programming Instructions
1. Open Vivado  
2. Run Synthesis → Implementation → Bitstream  
3. Open Hardware Manager → Program Basys3  
4. Toggle switches SW0–SW3 to generate requests  
5. Use SW4 to toggle between:
   - **1 = Fixed Priority**
   - **0 = Round Robin**  
6. Observe grant outputs on LEDs

---

## 📄 License
Free to use for academic projects.

