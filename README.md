# A Project for the AVR - Written in Assembler Language

The purpose of this assignment is to write a small software project in assembler code. The MCU to be used is the AVR ATmega2560, and the project should include some form of interaction with sensors and actuators.

## Description of the Project

You are going to design and implement an application on the AVR atmega2560 microcontroller. This could be a game, a "smart-home" device, some sort of controller of electrical equipment. Your imagination and time are the only limits.

The following are some non-functional requirements for the project:
* The application must be written in AVR assembler
* Your project must include some form of user interface (using sensors and actuators from the Arduino starter kit)


### Learning goals (from the course description):
* Create functioning assembler programs for microcontrollers
* Analyse ASM programs (AVR MCU) and calculate execution time
* Execute and debug assembler programs
* Create applications using assembler programming
* Integrate simple I/O devices in embedded applications


## Deliveries

### Problem Formulation
The project’s purpose is to generate different sound pitches basing on the users movement.
The shorter the distance is, the higher the sound should be. The user creates “music” by increasing and decreasing the distance between a sensor and an object.
The subproblems are defined as follows:
1.	How to generate sound?
2.	How to measure the distance?
3.	How to update the sound pitch, when the distance is changing?
4.	How to connect the components to the Arduino board?

### Project Plan (Analysis, design and test plan)
Before implementing the project a use case diagram has been created. Each use case has a use case description. In order to know how the system should work a use case diagram has been created. In order to know the flow between the components, a sequence diagram has been created. All the diargams can be found in folder "Docs" in file "Instrument_Diagrams.asta".

Moreover a circuit diagram was created. It can be found in folder "Docs" in file "TheInstrument.jpg".

Afterwards a test plan was formulated.

Test cases:

1.The system
No	Description	                                                          LED	                    Buzzer
1	  User places an obstacle in the range of the sensor	                  LED is on and green	    Sound is generated
2	  User places an obstacle outside the range of the sensor	              LED is on and red	      Sound is not generated
3 	User brings the obstacle closer to the sensor (in the range of it)	  LED is on and green	    Sound with a higher sound pitch is                                                                                                     generated
4	  User brings the obstacle further from the sensor (in the range of it)	LED is on and green	    Sound with a lower sound pitch is                                                                                                       generated

2. The sensor
No	Description	                                              Output
1	  User places an obstacle in the range of the sensor	      The RGB LED is on
2 	User places an obstacle outside the range of the sensor	  The RGB LED is off

3. The buzzer 
No	Description	                                                            Output
1	  The delays between turning the buzzer on and off are getting longer	    The sound pitch is getting lower and it is seen on a sound                                                                             wave generator
2	  The delays between turning the buzzer on and off are getting shorter	  The sound pitch is getting higher and it is seen on a sound                                                                             wave generator

4. Clock
No	Description	                                Output
1	  1024 iteration cycles have passed	          The clock output in the debugger window is incremented
2 	0xFF*1024 (261120) iterations have passed	  The TOV0 flag is set in the debugger window

5. The LED
No	Description	            Output
1	  The input is 255,0,0	  The LED is red
2	  The input is 0,255,0	  The LED is green

Results:
All the test cases have been tested by the group members and given the expected output.

The last step before implementation was a task plan in order to divide getting the needed knowledge. 
Daniela	                                          Dominika
1.	Read docs about the RGB light                 1.	Read docs about the buzzer
2.	Read docs about the clock	                    2.	Read docs about the distance sensor
                            3.	Implement together
                            4.	Test together


### Implementation
The implementation can be found in the folder "WithFinalLED".
