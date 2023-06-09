import 'package:flutter/material.dart';

Map<String, TextStyle> codeHighlighting = {
  'if': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'else': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'while': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'for': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'do': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'switch': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'case': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'break': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'continue': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'return': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'try': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'catch': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'finally': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'throw': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'throws': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'package': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'import': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'public': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'private': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'class': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'interface':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'enum': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'struct': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'function': const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
  'method': const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
  'variable':
      const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
  'const': const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
  'let': const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
  'var': const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
  'true': const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  'false': const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  'null': const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  'undefined': const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  'new': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'this': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'super': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'static': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'virtual': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'override':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'typedef': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'lambda': const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
  'async': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'await': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'yield': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'yield*': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'protected':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'default': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'sizeof': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'typeof': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'delete': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'instanceof':
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'in': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'as': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'is': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'not': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'and': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'or': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'xor': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'not_eq': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitand': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitor': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitnot': const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitshift_left':
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitshift_right':
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'bitshift_right_unsigned':
      const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
  'mutable': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'inline': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'typename':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'typenameof':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'template':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'typename_template':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'typename_template_default':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'final': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'abstract':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'assert': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'namespace':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'using': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'module': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'procedure':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'closure': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'property':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'getter': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'setter': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),

  'protocol':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'delegate':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'event': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'event_handler':
      const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'signal': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'slot': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'thread': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'mutex': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'lock': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  'atomic': const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
  // Data types
  'int': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'float': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'double': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'bool': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'std': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),

  'print': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'input': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'string': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'String': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'Scanner': const TextStyle(color: Colors.purple),
  'System': const TextStyle(color: Colors.purple),
  'char': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'array': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'list': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'dictionary':
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'map': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'set': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'tuple': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  'object': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),

  'void': const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),

  'constructor':
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  // keywords
  'then': const TextStyle(color: Colors.blue),
  'elif': const TextStyle(color: Colors.blue),
  'fi': const TextStyle(color: Colors.blue),
  'esac': const TextStyle(color: Colors.blue),
  'until': const TextStyle(color: Colors.blue),
  'done': const TextStyle(color: Colors.blue),
  '{': const TextStyle(color: Colors.orange),
  '}': const TextStyle(color: Colors.orange),
  '(': const TextStyle(color: Colors.orange),
  ')': const TextStyle(color: Colors.orange),
  '[': const TextStyle(color: Colors.orange),
  ']': const TextStyle(color: Colors.orange),
  '=': const TextStyle(color: Colors.orange),
  '&': const TextStyle(color: Colors.orange),
  '.': const TextStyle(color: Colors.orange),
  "'": const TextStyle(color: Colors.orange),
  '"': const TextStyle(color: Colors.orange),
  'out': const TextStyle(color: Colors.orange),

  'boolean': const TextStyle(color: Colors.green),
  'byte': const TextStyle(color: Colors.green),
  'extends': const TextStyle(color: Colors.orangeAccent),

  'goto': const TextStyle(color: Colors.red),
  'implements': const TextStyle(color: Colors.orangeAccent),

  'long': const TextStyle(color: Colors.green),
  'native': const TextStyle(color: Colors.orangeAccent),

  'short': const TextStyle(color: Colors.green),
  'strictfp': const TextStyle(color: Colors.orangeAccent),
  'synchronized': const TextStyle(color: Colors.orangeAccent),
  'transient': const TextStyle(color: Colors.orangeAccent),
  'volatile': const TextStyle(color: Colors.orangeAccent),
  'println': const TextStyle(color: Colors.purple),
  'auto': const TextStyle(color: Colors.blue),

  'extern': const TextStyle(color: Colors.blue),
  'signed': const TextStyle(color: Colors.blue),

  'union': const TextStyle(color: Colors.blue),
  'unsigned': const TextStyle(color: Colors.blue),
};
