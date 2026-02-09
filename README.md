🎲 **Digital Dice Game – Craps**  

> Final Project – Digital Design (Bu-Ali Sina University, Computer Engineering Department – BASU)

![Craps Dice Game](pic/unnamed.jpg)

---

### ✨ Overview

This repository contains a complete hardware implementation of the classic **Craps** dice game, designed as a **digital logic design final project**.  
The system is implemented entirely in **VHDL** and targets an FPGA-style environment, focusing on:

- ✅ RTL design and modular datapath construction  
- ✅ FSM-based control of the game flow  
- ✅ Clean separation between datapath, controller, and display logic  
- ✅ Thorough testbenches for key components  

The design follows the specification from the project document **“DESIGN OF A DICE GAME – Digital Logic Design Project | Bu-Ali Sina – 4041”**, using:

- Two pseudo-random dice counters  
- An adder and comparator to implement the game rules  
- A point register to store the current point  
- A controller FSM to manage game state and outputs  

---

### 🎮 Game Rules (Craps – Hardware Version)

The system simulates rolling **two six‑sided dice** and evaluates the **sum (2–12)** according to these rules:

- **First roll (Come-out roll)**  
  - 🎉 **Win** if the sum is **7** or **11**  
  - 💀 **Lose** if the sum is **2**, **3**, or **12**  
  - ➕ **Point established** for any other sum (4, 5, 6, 8, 9, 10); this value is stored in the **point register**

- **Subsequent rolls**  
  - 🎯 **Win** if the sum equals the stored **point**  
  - 💥 **Lose** if the sum is **7**  
  - 🔁 Otherwise, keep rolling until win/lose is decided

User interaction:

- `Reset` button: starts a new game and clears state  
- `Roll` button: when pressed and then released, the dice values are captured and evaluated  
- Outputs appear on:
  - Two **7‑segment displays** (dice / sum representation, depending on implementation)  
  - Two LEDs: **Win** and **Lose**  

---

### 🤝 Collaborators

- 🧑‍🎓 **Amin Rahimi**  
  - GitHub: [`aminrm4`](https://github.com/aminrm4)  
  - Student ID: **40312358013**

- 🧑‍🎓 **Naseri**  
  - GitHub: [`Naseri0017`](https://github.com/Naseri0017)  
  - Student ID: **40312358043**

---

### 📜 License / Academic Context

- This project is a **final project for the Digital Design course** at **Bu‑Ali Sina University**  
  – **Computer Engineering (BASU Computer Department)**.  
- Instructor / reference GitHub: [`SSCBasu`](https://github.com/SSCBasu)  
- The VHDL code and structure are intended **for educational and academic use**, following the specification adapted from:  
  - “Final Project: Design of a Dice Game” (Dalhousie University) as cited in the project PDF.  

You are free to study and extend this design for **learning, teaching, and non‑commercial academic work**, while preserving the above credits and project context.

---

### 🙏 Acknowledgments

- Special thanks to the **Digital Design teaching team** and **TA group** for their guidance and feedback throughout the project.  
- In particular, appreciation to the **TA head and course staff** for providing the original project specification and support materials.  
- Thanks to the authors of the original dice game project specification adapted in the PDF for inspiring this implementation.

---

### 💡 Future Improvements

- ⏱️ Further optimization of resource usage and maximum clock frequency  
- 🎰 More elaborate display of both individual dice values (two 7‑segment displays)  
- 🧮 Adding score tracking across multiple games  
- 🧪 Expanding automated testbenches and coverage metrics  

Enjoy rolling the (digital) dice! 🎲✨

