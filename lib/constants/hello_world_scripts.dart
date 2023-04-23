const java = '''
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}''';

const cpp = '''
#include <iostream>
int main() {
    std::cout << "Hello, World!\n";
    return 0;
}''';

const python = '''print("Hello, World!")''';

const c = '''
#include <stdio.h>
int main() {
    printf("Hello, World!");
    return 0;
}''';

const csharp = '''
using System;
class Program {
    static void Main(string[] args) {
        Console.WriteLine("Hello, World!");
    }
}''';

const php = '''
<?php
echo "Hello, World!";
?>''';

const ruby = '''puts "Hello, World!"''';

const swift = '''print("Hello, World!")''';

const objectivec = '''
#include <Foundation/Foundation.h>
int main() {
    @autoreleasepool {
        NSLog(@"Hello, World!");
    }
    return 0;
}''';

const go = '''
package main
import "fmt"
func main() {
    fmt.Println("Hello, World!")
}''';

const kotlin = '''
fun main() {
    println("Hello, World!")
}''';

const rust = '''
fn main() {
    println!("Hello, World!");
}''';

const pascal = '''
program HelloWorld;
begin
    WriteLn('Hello, World!');
end.''';

const lua = '''print("Hello, World!")''';

const perl = '''print "Hello, World!";''';

const powershell = '''Write-Host "Hello, World!"''';

const r = '''cat("Hello, World!\n")''';

const tcl = '''puts "Hello, World!"''';

const mysql = '''SELECT 'Hello, World!';''';

const mongodb = '''printjson({'message': 'Hello, World!'})''';

const objc = '''
#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
    }
    return 0;
}''';

const groovy = '''
class Main {
    static void main(String[] args) {
        println "Hello, World!"
    }
}''';

const scala = '''
object Main {
    def main(args: Array[String]): Unit = {
        println("Hello, World!")
    }
}''';

const python2 = '''print "Hello, World!"''';

const python3 = '''print("Hello, World!")''';

const sql = '''SELECT 'Hello, World!';''';

const vb = '''
Module HelloWorld
    Sub Main()
        Console.WriteLine("Hello, World!")
    End Sub
End Module''';

const c99 = r'''
#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}''';

const swift4 = '''print("Hello, World!")''';

const bash = '''echo "Hello, World!"''';

const clojure = '''(println "Hello, world!")''';

const commonLisp = '''(write-line "Hello, world!")''';

const d = '''
import std.stdio;

void main()
{
    writeln("Hello, world!");
}''';

const elixir = '''IO.puts "Hello, world!"''';

const erlang = r'''
-module(hello).
-export([world/0]).

world() ->
    io:fwrite("Hello, world!\n").''';

const fortran = '''
program hello
   write(*,*) "Hello, world!"
end program hello''';

const golang = '''
package main
import "fmt"
func main() {
    fmt.Println("Hello, world!")
}''';

const haskell = '''main = putStrLn "Hello, world!"''';

const j = '''
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, world!");
    }
}''';

const julia = '''println("Hello, world!")''';
const octave = r'''printf("Hello, world!\n")''';

const prolog = '''main :- write('Hello, world!'), nl, halt.''';

const racket = '''
#lang racket
(write "Hello, world!")''';

const nodejs = '''console.log("Hello, World!");''';

const nasm = '''
section .data
    msg db "Hello World", 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 11
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
''';

const vb_net = '''
Module HelloWorld
    Sub Main()
        Console.WriteLine("Hello World")
    End Sub
End Module
''';

const oracle = '''
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/''';

const swift3 = '''print("Hello World")''';

const scala3 = '''
object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("Hello World")
  }
}''';

const fsharp = '''
[<EntryPoint>]
let main argv =
    printfn "Hello World"
    0''';

const sbcl = '''(write-line "Hello World")''';

const clojurescript = '''
; Hello world in ClojureScript
(ns hello-world.core)
(defn -main []
  (println "Hello World!"))''';

const cobol = '''
IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-WORLD.
PROCEDURE DIVISION.
DISPLAY "Hello World".
STOP RUN.''';

const dotnet_core = '''
using System;

class HelloWorld {
    static void Main(string[] args) {
        Console.WriteLine("Hello World");
    }
}''';

const deno = '''console.log("Hello World");''';

const vlang = '''
module main
fn main() {
    println("Hello World");
}''';

const factor = '''
USE: io
"Hello World" print''';

const ocaml = '''print_string "Hello World\n"''';

const crystal = '''puts "Hello World"''';

const nim = '''echo "Hello World"''';

const picolisp = ''''(prinl "Hello World")''';

const pypy = '''print("Hello World")''';

const scheme = '''
(display "Hello World")
(newline)''';

const smalltalk = '''Transcript show: 'Hello World'; cr.''';

const brainfuck =
    '''>+++++++++[<++++++++>-]<.>+++++++[<++++>-]<+.+++++++..+++.[-]>++++++++[<++++>-] <.#>+++++++++++[<++++++++>-]<-.--------.+++.------.--------.[-]>++++++++[<++++>- ]<+.[-]++++++++++.''';

const sqlite = '''SELECT 'Hello World';''';

const hack = '''
<?hh

echo "Hello, World!\n";''';

const dart = '''
void main() {
  print("Hello World");
}''';

const yabasic = '''
PRINT "Hello World"
END''';

const ada = '''
with Ada.Text_IO; use Ada.Text_IO;
procedure Hello is
begin
  Put_Line("Hello World");
end Hello;''';

const freebasic = '''print "Hello World"''';

const coffeescript = '''console.log "Hello World"''';

const icon = '''
procedure main()
  write("Hello, world!\n")
end''';

const verilog = r'''
module hello_world;
  initial begin
    $display("Hello World");
    $finish;
  end
endmodule''';

const forth = '''
: hello-world
  ." Hello World" cr
;''';

const gccasm = r'''
.section .data
msg db "Hello, World!",0xa

.section .text
.globl _start
_start:
  mov $4, %eax
  mov $1, %ebx
  mov $msg, %ecx
  mov $14, %edx
  int $0x80

  mov $1, %eax
  xor %ebx, %ebx
  int $0x80''';

const intercal = '''
PLEASE DO ,1 <- #13
PLEASE DO ,1 SUB #1 <- #234
PLEASE DO ,1 SUB #2 <- #189
PLEASE DO ,1 SUB #3 <- #250
PLEASE DO ,1 SUB #4 <- #230
PLEASE DO ,1 SUB #5 <- #23
PLEASE DO ,1 SUB #6 <- #128
PLEASE DO ,1 SUB #7 <- #214
PLEASE DO ,1 SUB #8 <- #19
PLEASE DO ,1 SUB #9 <- #71
PLEASE DO ,1 SUB #10 <- #245
PLEASE DO ,1 SUB #11 <- #233
PLEASE DO ,1 SUB #12 <- #129
PLEASE DO ,1 SUB #13 <- #107
PLEASE DO ,1 SUB #14 <- #22
PLEASE DO ,1 SUB #15 <- #231
PLEASE DO ,1 SUB #16 <- #148
PLEASE DO ,1 SUB #17 <- #22
PLEASE DO ,1 SUB #18 <- #129
PLEASE DO ,1 SUB #19 <- #114
PLEASE DO ,1 SUB #20 <- #18
PLEASE DO ,1 SUB #21 <- #128
PLEASE DO ,1 SUB #22 <- #9
PLEASE DO ,1 SUB #23 <- #208
PLEASE DO ,1 SUB #24 <- #189
PLEASE DO ,1 SUB #25 <- #8
PLEASE DO ,1 SUB #26 <- #129
PLEASE DO ,1 SUB #27 <- #108
PLEASE DO ,1 SUB #28 <- #2
PLEASE DO ,1 SUB #29 <- #191
PLEASE DO ,1 SUB #30 <- #181
PLEASE DO ,1 SUB #31 <- #12
PLEASE READ OUT ,1
PLEASE GIVE UP''';

const nemerle = '''System.Console.WriteLine("Hello World");''';

const spidermonkey = '''print("Hello World");''';

const rhino = '''print("Hello World");''';

const bc = '''print "Hello World"\n''';

const clisp = '''(print "Hello World")''';

const jlang = '''
public class Hello {
  public static void main(String[] args) {
    System.out.println("Hello World");
  }
}''';

const haxe = '''
class Main {
  static function main() {
    trace("Hello World");
  }
}''';

const fasm = r'''
format ELF executable 3
entry start

segment readable executable
start:
    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, hello_size
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80

segment readable writeable
hello:
    db "Hello, world!", 0xa
hello_size:
    equ $-hello
''';

const awk = '''BEGIN { print "Hello World" }''';

const algol = '''
BEGIN
        print("Hello, World");
    END;''';

const befunge = '''
>25*"!dlroW olleH":v
                v:,_@
                >  ^  ?''';

const mozart = '''System.showln("Hello World");''';
const lolcode = '''
CAN HAS STDIO?
VISIBLE "Hello World"
KTHXBYE''';
const falcon = '''"Hello World" puts''';
const fantom = '''class Main { static Void main() { echo("Hello World"); } }''';
const pike = '''int main() { write("Hello World\n"); return 0; }''';
const whitespace =
    '''  \t \n\t  \n \t   \n  \n\n\n\t\n \t\t\n\n  \n\n \n\n\n \t \t \t \n  \n\n\n\n\n\n  \n\n  \n\n\n\n  \n\t\n \t \n \t\t\n \n\n\t \n\t\n \t\n\t\n\n\n\n\n\n\n \t \t \n \t \n \n \n \t\t\n \t \n\t\n \n\n\n\n\n\n\n\n \t \n \t\t\n \n \n \t\t\n \t \n\n\n\n\n\n\n\n\n  \n \n \n \t \t \n \t \n \n \n\t\n \n \t\n\n\n\n\n\n\n\n \n\n \t \t \n \t \n \t\t\n \n\n\t \n\t\n \t\n\t\n\n\n\n\n\n\n \t \t \n \t \n \n \n \t\t\n \t \n\t\n \n\n\n\n\n\n\n\n \t \n \t\t\n \n \n \t\t\n \t \n\n\n\n\n\n\n\n\n \t \n \t \t \n \n \n \n\t\n \n \t\n\n\n\n\n\n\n\n\n \n\n\n \t \t \n \t \n \t\t\n \n\n\t \n\t\n \t\n\t\n\n\n\n\n\n\n \t \t \n \t \n \n \n \t\t\n \t \n\t\n \n\n\n\n\n\n\n\n \t \n \t\t\n \n \n \t\t\n \t \n\n\n\n\n\n\n\n\n  \n \n \n \t \t \n \t \n \n \n\t\n \n \t\n\n\n\n\n\n\n\n \t\t\t\n''';
const unlambda = '''(hello world)R`.H.e.l.l.o. .w.o.r.l.d.!`''';
const cpp14 = '''
#include <iostream>
using namespace std;
int main() {
    cout << "Hello World" << endl;
    return 0;
}''';
const cpp17 = '''
#include <iostream>
using namespace std;
int main() {
    cout << "Hello World" << endl;
    return 0;
}''';

const blockly = '';

const helloWorldScriptList = [
  java,
  c99,
  cpp,
  cpp14,
  cpp17,
  php,
  perl,
  python2,
  python3,
  ruby,
  go,
  scala,
  bash,
  sql,
  pascal,
  csharp,
  objc,
  swift,
  groovy,
  fortran,
  brainfuck,
  lua,
  tcl,
  hack,
  rust,
  ada,
  freebasic,
  verilog,
  cobol,
  dart,
  yabasic,
  clojure,
  nodejs,
  scheme,
  forth,
  prolog,
  octave,
  coffeescript,
  icon,
  fsharp,
  nasm,
  gccasm,
  intercal,
  nemerle,
  ocaml,
  unlambda,
  picolisp,
  spidermonkey,
  rhino,
  bc,
  clisp,
  elixir,
  factor,
  falcon,
  fantom,
  nim,
  pike,
  smalltalk,
  mozart,
  lolcode,
  racket,
  kotlin,
  whitespace,
  erlang,
  jlang,
  haxe,
  fasm,
  awk,
  algol,
  befunge,
  blockly,
];

Map<String, String> helloWorldScripts = {
  'java': java,
  'c99': c99,
  'cpp': cpp,
  'cpp14': cpp14,
  'cpp17': cpp17,
  'php': php,
  'perl': perl,
  'python2': python2,
  'python3': python3,
  'ruby': ruby,
  'go': go,
  'scala': scala,
  'bash': bash,
  'sql': sql,
  'pascal': pascal,
  'csharp': csharp,
  'objc': objc,
  'swift': swift,
  'groovy': groovy,
  'fortran': fortran,
  'brainfuck': brainfuck,
  'lua': lua,
  'tcl': tcl,
  'hack': hack,
  'rust': rust,
  'ada': ada,
  'freebasic': freebasic,
  'verilog': verilog,
  'cobol': cobol,
  'dart': dart,
  'yabasic': yabasic,
  'clojure': clojure,
  'nodejs': nodejs,
  'scheme': scheme,
  'forth': forth,
  'prolog': prolog,
  'octave': octave,
  'coffeescript': coffeescript,
  'icon': icon,
  'fsharp': fsharp,
  'nasm': nasm,
  'gccasm': gccasm,
  'intercal': intercal,
  'nemerle': nemerle,
  'ocaml': ocaml,
  'unlambda': unlambda,
  'picolisp': picolisp,
  'spidermonkey': spidermonkey,
  'rhino': rhino,
  'bc': bc,
  'clisp': clisp,
  'elixir': elixir,
  'factor': factor,
  'falcon': falcon,
  'fantom': fantom,
  'nim': nim,
  'pike': pike,
  'smalltalk': smalltalk,
  'mozart': mozart,
  'lolcode': lolcode,
  'racket': racket,
  'kotlin': kotlin,
  'whitespace': whitespace,
  'erlang': erlang,
  'jlang': jlang,
  'haxe': haxe,
  'fasm': fasm,
  'awk': awk,
  'algol': algol,
  'befunge': befunge,
  'blockly': blockly,
};
