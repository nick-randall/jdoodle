Map<String, String> codeSnippets = {
  'c-99': '''
#include <stdio.h>
int main() {
    char input[100];
    printf("Enter a line: ");
    fgets(input, 100, stdin);
    printf("You typed this line: %s", input);
    return 0;
}
    ''',
  'c++': '''
#include <iostream>
using namespace std;
int main() {
    string input;
    cout << "Enter a line: ";
    getline(cin, input);
    cout << "You typed this line: " << input << endl;
    return 0;
}
    ''',
  'c++14': '''
#include <iostream>
using namespace std;
int main() {
    string input;
    cout << "Enter a line: ";
    getline(cin, input);
    cout << "You typed this line: " << input << endl;
    return 0;
}
    ''',
  'c++17': '''
#include <iostream>
using namespace std;
int main() {
    string input;
    cout << "Enter a line: ";
    getline(cin, input);
    cout << "You typed this line: " << input << endl;
    return 0;
}
    ''',
  'php': '''
<?php
\$input = readline("Enter a line: ");
echo "You typed this line: " . \$input . "\n";
?>
    ''',
  'perl': '''
print "Enter a line: ";
my \$input = <STDIN>;
chomp \$input;
print "You typed this line: \$input\n";
    ''',
  'python2': '''
input = raw_input("Enter a line: ")
print "You typed this line:", input
    ''',
  'python3': '''
input = input("Enter a line: ")
print("You typed this line:", input)
    ''',
  'ruby': '''
print "Enter a line: "
input = gets.chomp
puts "You typed this line: #{input}"
    ''',
  'go': '''
package main
import "fmt"
func main() {
    var input string
    fmt.Print("Enter a line: ")
    fmt.Scanln(&input)
    fmt.Println("You typed this line:", input)
}
    ''',
  'scala': '''
object Main extends App {
    println("Enter a line: ")
    val input = scala.io.StdIn.readLine()
    println("You typed this line: " + input)
}
    ''',
  'bash': r'''
echo -n "Enter a line: "
read input
echo "You typed this line: $input"
    ''',
  'sql': '''
SELECT 'Enter a line: ';
SET @input = (SELECT TRIM(BOTH '"' FROM @@VERSION_COMMENT));
SELECT CONCAT('You typed this line: ', @input);
    ''',
  'pascal': '''
program UserInput;
uses sysutils;
var
    input: string;
begin
    Write('Enter a line: ');
    Readln(input);
    Writeln('You typed this line: ', input);
end.
    ''',
  'c#': '''
using System;
class MainClass {
    static void Main() {
        Console.Write("Enter a line: ");
        string input = Console.ReadLine();
        Console.WriteLine("You typed this line: " + input);
    }
}
    ''',
  'objective-c': '''
#import <Foundation/Foundation.h>
int main() {
    char input[100];
    printf("Enter a line: ");
    fgets(input, 100, stdin);
    NSString *nsInput = [NSString stringWithUTF8String:input];
    printf("You typed this line: %s", [nsInput UTF8String]);
    return 0;
}
    ''',
  'swift': '''
import Foundation
print("Enter a line: ", terminator: "")
if let input = readLine() {
    print("You typed this line: \(input)")
}
    ''',
  'groovy': r'''
print "Enter a line: "
def input = System.console().readLine()
println "You typed this line: $input"
    ''',
  'fortran': '''
program user_input
    character(len=100) :: input
    write(*,*) "Enter a line: "
    read(*,*) input
    write(*,*) "You typed this line: ", trim(input)
end program user_input
    ''',
  'brainf**k': '''
,       ; read input into first memory cell
[       ; start loop
    .   ; print current memory cell
    -   ; decrement current memory cell
    ,   ; read next input into current memory cell
]       ; end loop
    ''',
  'lua': '''
io.write("Enter a line: ")
local input = io.read()
print("You typed this line: " .. input)
    ''',
  'tcl': r'''
puts -nonewline "Enter a line: "
flush stdout
set input [gets stdin]
puts "You typed this line: $input"
    ''',
  'hack': '''
<?hh
\$input = readline("Enter a line: ");
echo "You typed this line: " . \$input . "\n";
?>
    ''',
  'rust': '''
use std::io;
fn main() {
    let mut input = String::new();
    println!("Enter a line: ");
    io::stdin().read_line(&mut input).unwrap();
    println!("You typed this line: {}", input.trim());
}
    ''',
  'ada': '''
with Ada.Text_IO; use Ada.Text_IO;
procedure User_Input is
    input: String(1..100);
begin
    Put("Enter a line: ");
    Skip_Line;
    Get_Line(input, Last => 100);
    Put("You typed this line: ");
    Put_Line(input(1..input'Length));
end User_Input;
    ''',
  'r': '''
input <- readline("Enter a line: ")
cat("You typed this line: ", input, "\n")
    ''',
  'freebasic': r'''
#include "vbcompat.bi"
dim input as string
print "Enter a line: ";
input = input$(maxint)
print "You typed this line: " + input
    ''',
  'verilog': r'''
initial begin
    $display("Enter a line: ");
    $fscanf("%s", input);
    $display("You typed this line: %s", input);
end
    ''',
  'cobol': '''
IDENTIFICATION DIVISION.
PROGRAM-ID. USER-INPUT.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 INPUT PIC X(100).
PROCEDURE DIVISION.
    DISPLAY "Enter a line: ".
    ACCEPT INPUT.
    DISPLAY "You typed this line: " INPUT.
    STOP RUN.
    ''',
  'dart': r'''
  import 'dart:io';
void main() {
  stdout.write('Enter a line: ');
  String input = stdin.readLineSync();
  print('You typed this line: $input');
}''',
  'haskell': r'''
main = do
  putStr "Enter a line: "
  input <- getLine
  putStrLn $ "You typed this line: " ++ input
''',
  'assembly-nasm': '''
section .data
  prompt db 'Enter a line: ', 0
  input db 100
  
section .text
  global _start

_start:
  ; Print prompt
  mov eax, 4
  mov ebx, 1
  mov ecx, prompt
  mov edx, 14
  int 0x80
  
  ; Read input
  mov eax, 3
  mov ebx, 2
  mov ecx, input
  mov edx, 100
  int 0x80
  
  ; Print input
  mov eax, 4
  mov ebx, 1
  mov ecx, input
  mov edx, 100
  int 0x80
  
  ; Exit
  mov eax, 1
  xor ebx, ebx
  int 0x80
''',
  'assembly-gcc': r'''
.section .data
prompt:
  .ascii "Enter a line: "
input:
  .space 100
  
.section .text
.globl main
main:
  ; Print prompt
  mov $4, %eax
  mov $1, %ebx
  mov $prompt, %ecx
  mov $14, %edx
  int $0x80
  
  ; Read input
  mov $3, %eax
  mov $2, %ebx
  mov $input, %ecx
  mov $100, %edx
  int $0x80
  
  ; Print input
  mov $4, %eax
  mov $1, %ebx
  mov $input, %ecx
  mov $100, %edx
  int $0x80
  
  ; Exit
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80
''',
  'basic-fbc': r'''
input$ = space$(100)
print "Enter a line: ";: input input$

print "You typed this line: "; input$
''',
  'blockly': '''
Blockly.Blocks['io_in'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Enter a line:");
    this.setOutput(true, null);
    this.setColour(230);
    this.setTooltip("");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['io_out'] = {
  init: function() {
    this.appendValueInput("input")
        .setCheck(null)
        .appendField("You typed this line:");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
    this.setTooltip("");
    this.setHelpUrl("");
  }
};

Blockly.JavaScript['io_in'] = function(block) {
  var code = 'prompt("")';
  return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['io_out'] = function(block) {
  var value_input = Blockly.JavaScript.valueToCode(block, 'input', Blockly.JavaScript.ORDER_ATOMIC);
  var code = 'console.log("You typed this line: " + ' + value_input + ');';
  return code;
};
''',
  'brainfuck': '''
,[.,]
''',
  'c-gcc': '''
#include <stdio.h>

int main() {
  char input[100];
  
  printf("Enter a line: ");
  fgets(input, 100, stdin);
  
  printf("You typed this line: %s", input);
  
  return 0;
}
''',
  // ... previous languages
  'tex': '''
import 'dart:io';
void main() {
  stdout.write("Enter a line: ");
  String input = stdin.readLineSync();
  print('You typed this line: \n\$input');
}
''',
  'vb': r'''
Imports System

Module Program
    Sub Main(args As String())
        Console.Write("Enter a line: ")
        Dim input As String = Console.ReadLine()
        Console.WriteLine($"You typed this line:{vbCrLf}{input}")
    End Sub
End Module
''',
  'vlang': '''
module main

import "fmt"

fn main() {
    var input string
    fmt.Print("Enter a line: ")
    fmt.Scanln(&input)
    fmt.Printf("You typed this line:\n%s\n", input)
}
''',
  'zig': '''
const std = @import("std");

pub fn main() !void {
    var stdin = std.io.getStdIn().reader();
    std.debug.print("Enter a line: ");
    var line = try stdin.readLineAlloc(1024);
    defer std.heap.free(line);
    std.debug.print("You typed this line:\n{}\n", line);
}
''',
  'zsh': r'''
#!/bin/zsh
echo -n "Enter a line: "
read input
echo "You typed this line:"
echo $input
''',
};
