; Cartridge structure
(cartridge_line) @comment.documentation

(version_line
  "version" @keyword)

(version_line
  number: (version_number) @number)

(section_marker) @keyword.directive

(opaque_content
  (data_line) @string.special)

; Keywords
"return" @keyword.return

[
  "goto"
  "in"
  "local"
] @keyword

(label_statement) @label

(break_statement) @keyword

(do_statement
  [
    "do"
    "end"
  ] @keyword)

(while_statement
  [
    "while"
    "do"
    "end"
  ] @repeat)

(shorthand_while_statement
  "while" @repeat)

(repeat_statement
  [
    "repeat"
    "until"
  ] @repeat)

(if_statement
  [
    "if"
    "then"
    "end"
  ] @conditional)

(elseif_statement
  [
    "elseif"
    "then"
  ] @conditional)

(else_statement
  "else" @conditional)

(shorthand_if_statement
  [
    "if"
    "else"
  ] @conditional)

(for_statement
  [
    "for"
    "do"
    "end"
  ] @repeat)

(function_declaration
  [
    "function"
    "end"
  ] @keyword.function)

(function_definition
  [
    "function"
    "end"
  ] @keyword.function)

; Operators
(binary_expression
  operator: _ @operator)

(unary_expression
  operator: _ @operator)

(compound_assignment_statement
  operator: _ @operator)

(print_statement
  "?" @operator)

"=" @operator

[
  "and"
  "not"
  "or"
] @keyword.operator

; Punctuations
[
  ";"
  ":"
  ","
  "."
] @punctuation.delimiter

; Brackets
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; Variables
(identifier) @variable

((identifier) @variable.builtin
  (#eq? @variable.builtin "self"))

(variable_list
  (attribute
    "<" @punctuation.bracket
    (identifier) @attribute
    ">" @punctuation.bracket))

; Constants
((identifier) @constant
  (#match? @constant "^[A-Z][A-Z_0-9]*$"))

(vararg_expression) @constant

(nil) @constant.builtin

[
  (false)
  (true)
] @boolean

; Tables
(field
  name: (identifier) @field)

(dot_index_expression
  field: (identifier) @field)

(table_constructor
  [
    "{"
    "}"
  ] @constructor)

; Functions
(parameters
  (identifier) @parameter)

(function_declaration
  name: [
    (identifier) @function
    (dot_index_expression
      field: (identifier) @function)
  ])

(function_declaration
  name: (method_index_expression
    method: (identifier) @method))

(assignment_statement
  (variable_list
    .
    name: [
      (identifier) @function
      (dot_index_expression
        field: (identifier) @function)
    ])
  (expression_list
    .
    value: (function_definition)))

(table_constructor
  (field
    name: (identifier) @function
    value: (function_definition)))

(function_call
  name: [
    (identifier) @function.call
    (dot_index_expression
      field: (identifier) @function.call)
    (method_index_expression
      method: (identifier) @method.call)
  ])

; Pico-8 built-in functions
(function_call
  name: (identifier) @function.builtin
  (#any-of? @function.builtin
    ; graphics
    "camera" "circ" "circfill" "clip" "cls" "color" "cursor" "fget" "fillp"
    "flip" "fset" "line" "oval" "ovalfill" "pal" "palt" "pget" "print"
    "pset" "rect" "rectfill" "sget" "spr" "sset" "sspr" "tline"
    ; map
    "map" "mget" "mset"
    ; input
    "btn" "btnp"
    ; sound
    "music" "sfx"
    ; math
    "abs" "atan2" "band" "bnot" "bor" "bxor" "ceil" "cos" "flr" "lshr"
    "max" "mid" "min" "rnd" "rotl" "rotr" "sgn" "shl" "shr" "sin" "sqrt"
    "srand"
    ; tables
    "add" "all" "count" "del" "deli" "foreach" "ipairs" "next" "pack"
    "pairs" "unpack"
    ; strings
    "chr" "ord" "split" "sub" "tonum" "tostr" "type"
    ; memory and system
    "cartdata" "cstore" "dget" "dset" "memcpy" "memset" "peek" "peek2"
    "peek4" "poke" "poke2" "poke4" "reload" "reset" "run" "stat"
    ; misc
    "assert" "cocreate" "coresume" "costatus" "menuitem" "printh"
    "setmetatable" "getmetatable" "rawequal" "rawget" "rawlen" "rawset"
    "select" "stop" "trace" "yield" "_update60" "extcmd" "time" "t"
    "_init" "_update" "_draw"))

; Comments
(comment) @comment

(number) @number

(string) @string

(escape_sequence) @string.escape
