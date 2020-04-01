# Digital_System_Design
This reposistory includes code from coursework done for the module Digital System Design EE3.05 taught at Imperial College London by Prof. Christos Bouganis. The goal of the module was to familiarize students FPGA's, CPU architecture and HW/SW partitioning. Our objective in the coursework was to accelerate an application through reconfigurable HW.

In collaboration with Omar Tahir (Talndir)

## Specifications

The code given in this repository describes the steps taken to accelerate the function shown below on a FPGA with the NIOSII embedded processor. We have used the Intel FPGA Embedded Development Suite Quartus 18.1.
The different tasks describe our design process to get to our final result. Which was a latency of 219 ms, Error of 0.0033% and used FPGA resources of 11.9%. The results of the configurations we have used to get there are shown in the figure below.
![Evaluated function](Figures/DSD_formula.PNG)
![Design process](Figures/Results-DSD3.PNG)

## Structure
```
├── DSD_coursework_2020               # This repo from Omar Tahir includes Task 8
├── Pictures
     ├── DSD_formula.png              # Evaluated formula
     ├── DSDpt3.png                   # Used configurations
     ├── DSDRecap.png                 # Used configurations
     ├── Results-DSD3.png             # Results of all the different configurations
     └── sincos_cordic.png            # Simulation (Modelsim) of our Cordic algorithm
├── ip                                # Ip's for testing
     └── system_template_de1_soc
├── Task2                             # Computing a simple function
     └── system_template_de1_soc
├── Task3                             # Storing the program and Data on External Memories
     └── system_template_de1_soc
├── Task4                             # Evaluate a More Complex Mathematical Expression
     └── system_template_de1_soc
├── Task5                             # Add Multiplier Support
     └── system_template_de1_soc
├── Task6                             # Add Hardware Floating-Point Units
     └── system_template_de1_soc
├── Task7                             # Add Dedicated Hardware Block to compute the inner part of the arithmic expression (Cordic)
     └── system_template_de1_soc
├── Final Report                    
└── Readme.md
```
