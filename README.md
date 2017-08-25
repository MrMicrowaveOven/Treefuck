# Treehugger

Here's a one-liner to clone the repo and run the tests.

`git clone https://github.com/MrMicrowaveOven/Treehugger.git && cd Treehugger && bundle install && rspec`

## Objective

Implement the programming language Treehugger, which is based on Brainfuck (another language).

You should write an interpreter (takes in a program as a string and execute it) and implement any necessary underlying data structure(s).

## Process

The language consists of nine commands, listed below. A Treehugger program is
a sequence of these commands, possibly interspersed with other
characters (which are ignored). The commands are executed sequentially, with
some exceptions: an instruction pointer begins at the first command, and each
command it points to is executed, after which it normally moves forward to
the next command. The program terminates when the instruction pointer moves
past the last command.

The Treehugger language uses a simple machine model consisting of the program
and instruction pointer, as well as an infinitely large binary tree, with each
node initialized to zero.

## Commands
* `<` Move the data pointer to point to the left subtree of the current node
* `>`  Move the data pointer to point to the right subtree of the current node
* `|`  Move the data pointer to point to the parent of the current node
* `+`  Increment the byte stored in the current node
* `-`  Decrement the byte stored in the current node
* `.`  Output the byte stored in the current node to stdout
* `,`  Read one byte of input from stdin, and store it in the current node
* `[` If the current node contains zero, jump the instruction pointer to the command after the matching ]. Otherwise continue
* `]` If the current node does not contain zero, jump the instruction pointer to the command after the matching [. Otherwise continue

### Examples

Read a byte as input, then count down from that byte, outputting each number:

`,[.-]`

Read two bytes as input, then output their sum

`<,|>,|<[-|+<]|>[-|+>]|.`

Print "Hello World!" (I haven't gotten this one to work yet)

`++++++++[>++++[>++>+++>+++>+||||-]>+>+>->>+[|]|-]>>.>---.+++++++..+++.>>.|-.|.+++.------.--------.>>+.>++.`
