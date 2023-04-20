import 'package:jdoodle/language.dart';

final languages = [
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

final java = JdoodleLanguage(
  name: 'Java',
  code: 'java',
  versions: [
    'JDK 1.8.0_66',
    'JDK 1.8.0_66',
    'JDK 9.0.1',
    'JDK 9.0.1',
    'JDK 10.0.1',
    'JDK 10.0.1',
    'JDK 11.0.4',
    'JDK 11.0.4',
    'JDK 17.0.1',
    'JDK 17.0.1',
    'GCC 5.3.0',
    'GCC 5.3.0',
    'Zapcc 5.0.0',
    'Zapcc 5.0.0',
    'GCC 7.2.0',
    'GCC 7.2.0',
    'GCC 8.1.0',
    'GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0',
    'GCC 11.1.0'
  ],
);

final c99 = JdoodleLanguage(
  name: 'C-99',
  code: 'c99',
  versions: [
    'GCC 5.3.0',
    'GCC 5.3.0',
    'GCC 7.2.0',
    'GCC 7.2.0',
    'GCC 8.1.0',
    'GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0',
    'GCC 11.1.0'
  ],
);

final cpp = JdoodleLanguage(
  name: 'C++',
  code: 'cpp',
  versions: [
    'GCC 5.3.0',
    'GCC 5.3.0',
    'Zapcc 5.0.0',
    'Zapcc 5.0.0',
    'GCC 7.2.0',
    'GCC 7.2.0',
    'GCC 8.1.0',
    'GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0',
  ],
);
final cpp14 = JdoodleLanguage(
  name: 'C++ 14',
  code: 'cpp14',
  versions: [
    'GCC 5.3.0',
    'g++ 14 GCC 7.2.0',
    'g++ 14 GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0'
  ],
);

final cpp17 = JdoodleLanguage(
  name: 'C++ 17',
  code: 'cpp17',
  versions: ['g++ 17 GCC 9.1.0', 'GCC 11.1.0'],
);

final php = JdoodleLanguage(
  name: 'PHP',
  code: 'php',
  versions: [
    '5.6.16',
    '5.6.16',
    '7.1.11',
    '7.1.11',
    '7.2.5',
    '7.2.5',
    '7.3.10',
    '7.3.10',
    '8.0.13',
    '8.0.13'
  ],
);

final perl = JdoodleLanguage(
  name: 'Perl',
  code: 'perl',
  versions: [
    '5.22.0',
    '5.22.0',
    '5.26.1',
    '5.26.1',
    '5.26.2',
    '5.26.2',
    '5.30.0',
    '5.30.0',
    '5.34.0',
    '5.34.0'
  ],
);

final python2 = JdoodleLanguage(
  name: 'Python 2',
  code: 'python2',
  versions: [
    '2.7.11',
    '2.7.11',
    '2.7.15',
    '2.7.15',
    '2.7.16',
    '2.7.16',
    '2.7.18',
    '2.7.18'
  ],
);

final python3 = JdoodleLanguage(
  name: 'Python 3',
  code: 'python3',
  versions: [
    '3.5.1',
    '3.5.1',
    '3.6.3',
    '3.6.3',
    '3.6.5',
    '3.6.5',
    '3.7.4',
    '3.7.4',
    '3.9.9',
    '3.9.9'
  ],
);

final ruby = JdoodleLanguage(
  name: 'Ruby',
  code: 'ruby',
  versions: [
    '2.2.4',
    '2.2.4',
    '2.4.2p198',
    '2.4.2p198',
    '2.5.1p57',
    '2.5.1p57',
    '2.6.5',
    '2.6.5',
    '3.0.2',
    '3.0.2'
  ],
);

final go = JdoodleLanguage(
  name: 'GO Lang',
  code: 'go',
  versions: [
    '1.5.2',
    '1.5.2',
    '1.9.2',
    '1.9.2',
    '1.10.2',
    '1.10.2',
    '1.13.1',
    '1.13.1',
    '1.17.3',
    '1.17.3'
  ],
);

final scala = JdoodleLanguage(
  name: 'Scala',
  code: 'scala',
  versions: [
    '2.12.0',
    '2.12.0',
    '2.12.4',
    '2.12.4',
    '2.12.5',
    '2.12.5',
    '2.13.0',
    '2.13.0',
    '2.13.6',
    '2.13.6'
  ],
);

final bash = JdoodleLanguage(
  name: 'Bash Shell',
  code: 'bash',
  versions: [
    '4.3.42',
    '4.3.42',
    '4.4.12',
    '4.4.12',
    '4.4.19',
    '4.4.19',
    '5.0.011',
    '5.0.011',
    '5.1.12',
    '5.1.12'
  ],
);

final sql = JdoodleLanguage(
  name: 'SQL',
  code: 'sql',
  versions: [
    'SQLite 3.9.2',
    'SQLite 3.9.2',
    'SQLite 3.21.0',
    'SQLite 3.21.0',
    'SQLite 3.23.1',
    'SQLite 3.23.1',
    'SQLite 3.29.0',
    'SQLite 3.29.0',
    '3.37.0',
  ],
);

final pascal = JdoodleLanguage(
  name: 'Pascal',
  code: 'fpc-3.2.2',
  versions: [
    'fpc 3.0.0',
    'fpc-3.0.2',
    'fpc-3.0.4',
    'fpc-3.2.2',
  ],
);

final csharp = JdoodleLanguage(
  name: 'C#',
  code: 'csharp',
  versions: [
    'mono 4.2.2',
    'mono 5.0.0',
    'mono 5.10.1',
    'mono 6.0.0',
    'mono-6.12.0',
  ],
);

final vbn = JdoodleLanguage(
  name: 'VB.net',
  code: 'vbn',
  versions: [
    'mono 4.0.1',
    'mono 4.6',
    'mono 5.10.1',
    'mono 6.0.0',
    'mono-6.12.0',
  ],
);

final haskell = JdoodleLanguage(
  name: 'Haskell',
  code: 'haskell',
  versions: ['ghc 7.10.3', 'ghc 8.2.1', 'ghc 8.2.2', 'ghc 8.6.5', '9.0.1'],
);

final objc = JdoodleLanguage(
  name: 'Objective C',
  code: 'objc',
  versions: [
    'GCC 5.3.0',
    'GCC 5.3.0',
    'GCC 7.2.0',
    'GCC 7.2.0',
    'GCC 8.1.0',
    'GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0',
    'GCC 11.1.0'
  ],
);

final swift = JdoodleLanguage(
  name: 'Swift',
  code: 'swift',
  versions: [
    '2.2',
    '2.2',
    '3.1.1',
    '3.1.1',
    '4.1',
    '4.1',
    '5.1',
    '5.1',
    '5.5',
    '5.5'
  ],
);

final groovy = JdoodleLanguage(
  name: 'Groovy',
  code: 'groovy',
  versions: [
    '2.4.6 JVM: 1.7.0_99',
    '2.4.6 JVM: 1.7.0_99',
    '2.4.12 JVM: 9.0.1',
    '2.4.12 JVM: 9.0.1',
    '2.4.15 JVM: 10.0.1',
    '2.4.15 JVM: 10.0.1',
    '2.5.8 JVM: 11.0.4',
    '2.5.8 JVM: 11.0.4',
    '3.0.9 JVM: 17.0.1',
    '3.0.9 JVM: 17.0.1'
  ],
);

final fortran = JdoodleLanguage(
  name: 'Fortran',
  code: 'fortran',
  versions: [
    'GNU 5.3.0',
    'GNU 5.3.0',
    'GNU 7.2.0',
    'GNU 7.2.0',
    'GNU 8.1.0',
    'GNU 8.1.0',
    'GNU 9.1.0',
    'GNU 9.1.0',
    'GNU 11.1.0',
    'GNU 11.1.0'
  ],
);

final brainfuck = JdoodleLanguage(
  name: 'Brainf**k',
  code: 'brainfuck',
  versions: ['bfc-0.1'],
);

final lua = JdoodleLanguage(
  name: 'Lua',
  code: 'lua',
  versions: [
    '5.3.2',
    '5.3.2',
    '5.3.4',
    '5.3.4',
    '5.3.5',
    '5.3.5',
    '5.4.3',
    '5.4.3'
  ],
);

final tcl = JdoodleLanguage(
  name: 'TCL',
  code: 'tcl',
  versions: [
    '8.6',
    '8.6',
    '8.6.7',
    '8.6.7',
    '8.6.8',
    '8.6.8',
    '8.6.9',
    '8.6.9',
    '8.6.12',
    '8.6.12'
  ],
);

final hack = JdoodleLanguage(
  name: 'Hack',
  code: 'hack',
  versions: ['HipHop VM 3.13.0', 'HipHop VM 3.13.0'],
);

final rust = JdoodleLanguage(
  name: 'RUST',
  code: 'rust',
  versions: [
    '1.10.0',
    '1.10.0',
    '1.21.0',
    '1.21.0',
    '1.25.0',
    '1.25.0',
    '1.38.0',
    '1.38.0',
    '1.56.1',
    '1.56.1',
    'DMD64 D Compiler v2.071.1',
    'DMD64 D Compiler v2.071.1',
    'DMD64 D Compiler v2.088',
    'DMD64 D Compiler v2.088',
    'DMD64 D Compiler v2.098',
    'DMD64 D Compiler v2.098'
  ],
);

final ada = JdoodleLanguage(
  name: 'Ada',
  code: 'ada',
  versions: [
    'GNATMAKE 6.1.1',
    'GNATMAKE 6.1.1',
    'GNATMAKE 7.2.0',
    'GNATMAKE 7.2.0',
    'GNATMAKE 8.1.0',
    'GNATMAKE 8.1.0',
    'GNATMAKE 9.1.0',
    'GNATMAKE 9.1.0',
    'GNATMAKE 11.1.0',
    'GNATMAKE 11.1.0'
  ],
);

final undefined = JdoodleLanguage(
  name: 'R Language',
  code: 'undefined',
  versions: [
    '3.3.1',
    '3.3.1',
    '3.4.2',
    '3.4.2',
    '3.5.0',
    '3.5.0',
    '3.6.1',
    '3.6.1',
    '4.1.2',
    '4.1.2'
  ],
);

final freebasic = JdoodleLanguage(
  name: 'FREE BASIC',
  code: 'freebasic',
  versions: ['1.05.0', '1.05.0', '1.07.1', '1.07.1', '1.08.1', '1.08.1'],
);

final verilog = JdoodleLanguage(
  name: 'VERILOG',
  code: 'verilog',
  versions: ['10.1', '10.1', '10.2', '10.2', '10.3', '10.3', '11', '11'],
);

final cobol = JdoodleLanguage(
  name: 'COBOL',
  code: 'cobol',
  versions: [
    'GNU COBOL 2.0.0',
    'GNU COBOL 2.0.0',
    'GNU COBOL 2.2.0',
    'GNU COBOL 2.2.0',
    'GNU COBOL 3.0',
    'GNU COBOL 3.0',
    'GNU COBOL 3.1.2',
    'GNU COBOL 3.1.2'
  ],
);

final dart = JdoodleLanguage(
  name: 'Dart',
  code: 'dart',
  versions: [
    '1.18.0',
    '1.18.0',
    '1.24.2',
    '1.24.2',
    '1.24.3',
    '1.24.3',
    '2.5.1',
    '2.5.1',
    '2.14.4',
    '2.14.4'
  ],
);

final yabasic = JdoodleLanguage(
  name: 'YaBasic',
  code: 'yabasic',
  versions: ['2.769', '2.769', '2.84.1', '2.84.1'],
);

final clojure = JdoodleLanguage(
  name: 'Clojure',
  code: 'clojure',
  versions: [
    '1.8.0',
    '1.8.0',
    '1.9.0',
    '1.9.0',
    '1.10.1',
    '1.10.1',
    '1.10.3',
    '1.10.3'
  ],
);

final nodejs = JdoodleLanguage(
  name: 'NodeJS',
  code: 'nodejs',
  versions: [
    '6.3.1',
    '6.3.1',
    '9.2.0',
    '9.2.0',
    '10.1.0',
    '10.1.0',
    '12.11.1',
    '12.11.1',
    '17.1.0',
    '17.1.0'
  ],
);

final scheme = JdoodleLanguage(
  name: 'Scheme',
  code: 'scheme',
  versions: [
    'Gauche 0.9.4',
    'Gauche 0.9.4',
    'Gauche 0.9.5',
    'Gauche 0.9.5',
    'Gauche 0.9.8',
    'Gauche 0.9.8',
    'Gauche 0.9.10',
    'Gauche 0.9.10'
  ],
);

final forth = JdoodleLanguage(
  name: 'Forth',
  code: 'forth',
  versions: ['gforth 0.7.3'],
);

final prolog = JdoodleLanguage(
  name: 'Prolog',
  code: 'prolog',
  versions: [
    'GNU Prolog 1.4.4',
    'GNU Prolog 1.4.4',
    'GNU Prolog 1.4.5',
    'GNU Prolog 1.4.5',
    'GNU Prolog 1.5.0',
    'GNU Prolog 1.5.0'
  ],
);

final octave = JdoodleLanguage(
  name: 'Octave',
  code: 'octave',
  versions: [
    'GNU 4.0.0',
    'GNU 4.0.0',
    'GNU 4.2.1',
    'GNU 4.2.1',
    'GNU 4.4.0',
    'GNU 4.4.0',
    'GNU 5.1.0',
    'GNU 5.1.0',
    'GNU 6.4.0',
    'GNU 6.4.0'
  ],
);

final coffeescript = JdoodleLanguage(
  name: 'CoffeeScript',
  code: 'coffeescript',
  versions: [
    '1.11.1',
    '1.11.1',
    '2.0.0',
    '2.0.0',
    '2.3.0',
    '2.3.0',
    '2.4.1',
    '2.4.1',
    '2.6.1',
    '2.6.1'
  ],
);

final icon = JdoodleLanguage(
  name: 'Icon',
  code: 'icon',
  versions: ['9.4.3', '9.4.3', '9.5.1', '9.5.1'],
);

final fsharp = JdoodleLanguage(
  name: 'F#',
  code: 'fsharp',
  versions: ['4.1', '4.1', '4.5.0', '4.5.0'],
);

final nasm = JdoodleLanguage(
  name: 'Assembler - NASM',
  code: 'nasm',
  versions: [
    '2.11.08',
    '2.11.08',
    '2.13.01',
    '2.13.01',
    '2.13.03',
    '2.13.03',
    '2.14.02',
    '2.14.02',
    '2.15.05',
    '2.15.05'
  ],
);

final gccasm = JdoodleLanguage(
  name: 'Assembler - GCC',
  code: 'gccasm',
  versions: [
    'GCC 6.2.1',
    'GCC 6.2.1',
    'GCC 8.1.0',
    'GCC 8.1.0',
    'GCC 9.1.0',
    'GCC 9.1.0',
    'GCC 11.1.0',
    'GCC 11.1.0'
  ],
);

final intercal = JdoodleLanguage(
  name: 'Intercal',
  code: 'intercal',
  versions: ['0.30', '0.30'],
);

final nemerle = JdoodleLanguage(
  name: 'Nemerle',
  code: 'nemerle',
  versions: ['1.2.0.507', '1.2.0.507'],
);

final ocaml = JdoodleLanguage(
  name: 'Ocaml',
  code: 'ocaml',
  versions: ['4.03.0', '4.03.0', '4.08.1', '4.08.1', '4.12.0', '4.12.0'],
);

final unlambda = JdoodleLanguage(
  name: 'Unlambda',
  code: 'unlambda',
  versions: ['0.1.3', '0.1.3', '0.1.4.2', '0.1.4.2'],
);

final picolisp = JdoodleLanguage(
  name: 'Picolisp',
  code: 'picolisp',
  versions: [
    '3.1.11.1',
    '3.1.11.1',
    '17.11.14',
    '17.11.14',
    '18.5.11',
    '18.5.11',
    '18.9.5',
    '18.9.5',
    '21.6.30',
    '21.6.30'
  ],
);

final spidermonkey = JdoodleLanguage(
  name: 'SpiderMonkey',
  code: 'spidermonkey',
  versions: ['38', '38', '45.0.2', '45.0.2'],
);

final rhino = JdoodleLanguage(
  name: 'Rhino JS',
  code: 'rhino',
  versions: ['1.7.7.1', '1.7.7.1', '1.7.7.2', '1.7.7.2', '1.7.13', '1.7.13'],
);

final bc = JdoodleLanguage(
  name: 'BC',
  code: 'bc',
  versions: ['1.06.95', '1.06.95', '1.07.1', '1.07.1'],
);

final clisp = JdoodleLanguage(
  name: 'CLISP',
  code: 'clisp',
  versions: [
    'GNU CLISP 2.49 - GNU C 5.2.0',
    'GNU CLISP 2.49 - GNU C 5.2.0',
    'GNU CLISP 2.49 - GNU C 6.2.1',
    'GNU CLISP 2.49 - GNU C 6.2.1',
    'GNU CLISP 2.49.93 - GNU 8.1.0',
    'GNU CLISP 2.49.93 - GNU 8.1.0',
    'GNU CLISP 2.49.93 - GNU 9.1.0',
    'GNU CLISP 2.49.93 - GNU 9.1.0',
    'ecl 21.2.1',
    'sbcl 2.1.9',
    'ccl 1.12.1' 'abcl 1.8.0',
  ],
);

final elixir = JdoodleLanguage(
  name: 'Elixir',
  code: 'elixir',
  versions: [
    '1.3.4',
    '1.3.4',
    '1.5.2',
    '1.5.2',
    '1.6.4',
    '1.6.4',
    '1.9.1',
    '1.9.1',
    '1.12.2',
    '1.12.2'
  ],
);

final factor = JdoodleLanguage(
  name: 'Factor',
  code: 'factor',
  versions: ['8.25', '8.25', '8.28', '8.28', '8.29', '8.29', '8.31', '8.31'],
);

final falcon = JdoodleLanguage(
  name: 'Falcon',
  code: 'falcon',
  versions: ['0.9.6.8 (Chimera)', '0.9.6.8 (Chimera)'],
);

final fantom = JdoodleLanguage(
  name: 'Fantom',
  code: 'fantom',
  versions: ['1.0.69', '1.0.69'],
);

final nim = JdoodleLanguage(
  name: 'Nim',
  code: 'nim',
  versions: [
    '0.15.0',
    '0.15.0',
    '0.17.2',
    '0.17.2',
    '0.18.0',
    '0.18.0',
    '1.4.8',
    '1.4.8',
  ],
);

final pike = JdoodleLanguage(
  name: 'Pike',
  code: 'pike',
  versions: [
    'v8.0',
    'v8.0.702',
  ],
);

final smalltalk = JdoodleLanguage(
  name: 'SmallTalk',
  code: 'smalltalk',
  versions: ['GNU SmallTalk 3.2.92', 'GNU SmallTalk 3.2.92'],
);

final mozart = JdoodleLanguage(
  name: 'OZ Mozart',
  code: 'mozart',
  versions: ['2.0.0 (OZ 3)', '2.0.0 (OZ 3)'],
);

final lolcode = JdoodleLanguage(
  name: 'LOLCODE',
  code: 'lolcode',
  versions: ['0.10.5', '0.10.5'],
);

final racket = JdoodleLanguage(
  name: 'Racket',
  code: 'racket',
  versions: ['6.11', '6.11', '6.12', '6.12', '7.4', '7.4', '8.3', '8.3'],
);

final kotlin = JdoodleLanguage(
  name: 'Kotlin',
  code: 'kotlin',
  versions: [
    '1.1.51 (JRE 9.0.1+11)',
    '1.1.51 (JRE 9.0.1+11)',
    '1.2.40 (JRE 10.0.1)',
    '1.2.40 (JRE 10.0.1)',
    '1.3.50 (JRE 11.0.4)',
    '1.3.50 (JRE 11.0.4)',
    '1.6.0 (JRE 17.0.1+12)',
    '1.6.0 (JRE 17.0.1+12)'
  ],
);

final whitespace = JdoodleLanguage(
  name: 'Whitespace',
  code: 'whitespace',
  versions: ['0.3', '0.3'],
);

final erlang = JdoodleLanguage(
  name: 'Erlang',
  code: 'erlang',
  versions: ['22.1', '22.1', '24', '24'],
);

final jlang = JdoodleLanguage(
  name: 'J Language',
  code: 'jlang',
  versions: ['9.01.10', '9.01.10'],
);

final awk = JdoodleLanguage(
  name: 'AWK',
  code: 'awk',
  versions: ['NU Awk 5.1.1, API: 3.1', 'NU Awk 5.1.1, API: 3.1'],
);

final fasm = JdoodleLanguage(name: 'FASM', code: 'fasm', versions: ['1.73.27']);

final algol = JdoodleLanguage(
  name: 'Algol 68',
  code: 'algol',
  versions: ['Genie 2.8.5', 'Genie 2.8.5'],
);

final haxe = JdoodleLanguage(name: 'Haxe', code: 'haxe', versions: ['4.2.4']);

final befunge = JdoodleLanguage(
  name: 'Befunge',
  code: 'befunge',
  versions: [
    'cfunge 0.9.0',
  ],
);

final blockly = JdoodleLanguage(
  name: 'Blockly',
  code: 'blockly',
  versions: [],
);
