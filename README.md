# Simple Calculator

This is a simple calculator program implemented using Flex and Bison. The program reads mathematical expressions from the user, evaluates them, and prints the result. The calculator supports basic arithmetic operations like addition, subtraction, multiplication, and division, along with parentheses for grouping expressions.

## Table of Contents

1. [Features](#features)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Code Overview](#code-overview)

## Features

- Supports basic arithmetic operations: addition (`+`), subtraction (`-`), multiplication (`*`), and division (`/`).
- Handles parentheses for grouping `(` and `)`.
- Allows for multi-line input with results printed after each expression.
- Exits gracefully when the user types "STOP".

## Installation

### Prerequisites

- **Flex**: A lexical analyzer generator.
- **Bison**: A parser generator.

### Steps

1. Clone this repository or download the code files.
2. Compile the lexer and parser files using Flex and Bison:

   ```bash
   flex lexer.l
   bison -d parser.y
   gcc lex.yy.c parser.tab.c -o calc -lm
   ```

3. Run the compiled program:

    ```bash
    ./calc
    ```

### Usage

1. **Start the Program**: Run `./calc` in your terminal.
2. **Input Expressions**: Enter arithmetic expressions like `2 + 3 * 4` and press Enter.
3. **View Results**: The result of the expression will be printed after you press Enter.
4. **Exit the Program**: Type `STOP` and press Enter to exit.


### Example Usage

```bash
$./calc
Simple Calculator
Enter expressions (e.g., 2 + 3 * 4), press Ctrl+C to exit:
1 + 3
Result: 4
```

```bash
$./calc
Simple Calculator
Enter expressions (e.g., 2 + 3 * 4), press Ctrl+C to exit:
5 - 3
Result: 2
```

```bash
$./calc
Simple Calculator
Enter expressions (e.g., 2 + 3 * 4), press Ctrl+C to exit:
(2 + 3) * 5
Result: 25
STOP
Result: 25
Program parsed!
```

### Code Overview

## `lexer.l`
This is the Flex lexer file. It defines the lexical rules for the calculator, including recognizing numbers, arithmetic operators, parentheses, and the "STOP" command. The lexer returns tokens to the parser, which uses them to build expressions.

- **Token Definitions**: The lexer recognizes tokens like `TOK_NUMBER`, `TOK_ADD,` `TOK_SUB`, etc.
- **Handling Newlines**: The lexer returns a `TOK_NEWLINE` token when a newline is encountered.


## `parser.y`

This is the Bison parser file. It defines the grammar rules for the calculator and handles the evaluation of expressions.

- **Union Definition**: The union is used to store integer values associated with tokens.
- **Tokens**: Defined tokens include `TOK_NUMBER`, `TOK_ADD`, `TOK_SUB`, etc.
- **Grammar Rules**: The parser evaluates arithmetic expressions according to the defined grammar rules.
- **Statements**: The parser handles input statements, printing results after each expression and exiting when "STOP" is entered.


## Main Function

The main function initializes the calculator, continuously parses user input, and handles errors.



