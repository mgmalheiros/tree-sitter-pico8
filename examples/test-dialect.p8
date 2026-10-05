pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- Pico-8 Lua dialect features

-- Numeric literals
a = 0x1a.bc
b = 0b1010
c = 0xff
d = 1.5

-- Compound assignments
x = 0
x += 1
x -= 1
x *= 2
x /= 2
x %= 3
x \= 2
x ^= 2
x ..= "z"
x &= 0xff
x |= 0x0f
x ^^= 0x55
x <<= 1
x >>= 1
x >>>= 1
x <<>= 1
x >><= 1

-- != alias for ~=
if a != b then
 ?"different"
end

-- // line comment
// this is a Pico-8 comment
y = 1 // also a comment

-- ? print statement
?"hello"
?"x =", x, "y =", y

-- Bitwise + integer division
m = 5 \ 2
n = 0xff & 0x0f
o = 0x10 | 0x01
p = 0xaa ^^ 0x55
q = 1 << 4
r = 256 >> 2
s = -1 >>> 2
t = 0x1234 <<> 4
u = 0x1234 >>< 4
v = ~0xff

-- Peek shorthand operators
w = @0x5f00
w2 = %0x5f00
w4 = $0x5f00

-- Shorthand if
if (a < b) x = 1
if (a < b) x = 1 else x = 2
if (a < b) return 42

-- Shorthand while
while (x > 0) x -= 1

-- Standard if still works
if a == 1 then
 x = 10
elseif a == 2 then
 x = 20
else
 x = 30
end

-- Identifiers with Pico-8 glyphs
function check_buttons()
 if btnp(🅾️) then return 1 end
 if btnp(❎) then return 2 end
 return 0
end

-- For loops
for i = 1, 10 do
 ?i
end

for k, v in pairs({1, 2, 3}) do
 ?k, v
end

-- Tables and method calls
t = {a = 1, b = 2, [3] = "three"}
function t:greet(name)
 return "hello " .. name
end
?t:greet("world")
__gfx__
00000000
11111111
22222222
__gff__
0000
__map__
0000
__sfx__
000100000000
__music__
00 41424344
