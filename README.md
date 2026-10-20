# Multiplexers and Demultiplexers

In this lab you have learned about multiplexers and demultiplexers.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names Ashley Johnson and Jared Lackerman 

## Summary
The multiplexer selects one amoung multiple 4 bit inputs A,B,C,D based on slector bits and an enable line, outputting the chosen data on a wire. Then the demultiplexer takes this selected input and routes it to one of the multiple outputs depending on the selctor bits, which is controlled by enable. From the scenario, we implemented the logic so that a chosen resident's data is routed by the multiplexer to the libraryline, and the demultiplexer then directs that data to one of the several businesses. With the Basys3 board the buttons serve as selectors for choosing which input is sent through the multiplexer and which output is enabled on the demultiplexer. The LEDs indicate which businesses are connected and receiving data.  
## Lab Questions

### In plain English describe the function and use of a multiplexer.
A multiplexer switches one of the many input signals to a single output based on selector bits. It's like choosing one source to send through a shared line.
### In plain English describe the function and use of a demultiplexer.
A demultiplexer directs one input to one of the many outputs based on selector bits. It routes data to the right destination.
### What other uses might these circuits have? (Think Shannon’s)
Multiplexers and demultiplexers can implement any logic function and are used for data routing, bus control, and simplifying circuit designs.
