# CAD for VLSI – Graph and Optimization Algorithms in C++

This repository contains C++ implementations of fundamental algorithms used in
Computer-Aided Design (CAD) for VLSI systems. These algorithms are widely applied
in partitioning, placement, routing, and clustering stages of VLSI physical design.

The implementations are kept simple and educational, focusing on clarity and
conceptual understanding rather than tool-specific optimizations.

---

## Algorithms Implemented

### 1. Breadth First Search (BFS)
**File:** `BreadthFirstSearch.cpp`  
**Application in VLSI CAD:**
- Unweighted routing
- Connectivity analysis
- Clock tree traversal

---

### 2. Depth First Search (DFS)
**File:** `DepthSearchFirst.cpp`  
**Application in VLSI CAD:**
- Netlist connectivity checking
- Cycle detection
- Graph traversal

---

### 3. Dijkstra’s Algorithm
**File:** `Dijkstras_Algorithm.cpp`  
**Application in VLSI CAD:**
- Global and detailed routing
- Minimum-cost path computation considering wirelength and congestion

---

### 4. Lee’s Algorithm (Maze Routing)
**File:** `Lee.cpp`  
**Application in VLSI CAD:**
- Grid-based detailed routing
- Obstacle-aware shortest path routing

---

### 5. Prim’s Algorithm (Minimum Spanning Tree)
**File:** `PrimsAlgo.cpp`  
**Application in VLSI CAD:**
- Clock tree synthesis
- Interconnect wirelength minimization

---

### 6. K-Means Clustering Algorithm
**File:** `K_min_algo.cpp`  
**Application in VLSI CAD:**
- Standard cell clustering
- Placement optimization
- Partitioning of design modules

---

### 7. Cluster Growth Algorithm
**File:** `ClusterGrowth.cpp`  
**Application in VLSI CAD:**
- Placement-based clustering
- Grouping physically close cells to reduce interconnect cost

---

### 8. Kernighan–Lin (KL) Algorithm
**File:** `KL.cpp`  
**Application in VLSI CAD:**
- Circuit partitioning
- Min-cut optimization with balanced partitions

---

### 9. Force-Directed Placement Algorithm
**File:** `ForceDirected.cpp`  
**Application in VLSI CAD:**
- Early-stage placement
- Wirelength minimization using force equilibrium models

---

## Compilation and Execution

Each file can be compiled independently using a standard C++ compiler.

```bash
g++ filename.cpp -o output
./output
