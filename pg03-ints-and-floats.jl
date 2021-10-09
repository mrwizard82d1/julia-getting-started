# Integers

# Literals generate a value of the "default" integer type (Int64 on my workstation)
1
1234

# Types of Literals
typeof(1)

# Internal variable, `Sys.WORD_SIZE`, indicates word architecture of target system
Sys.WORD_SIZE

# Synonyms for signed and unsigned default integers
Int
UInt

# Values that **do not** fit in 32-bits but **can** be represented in 64-bits **always** create a 64-bit integer
typeof(3_000_000_000)

# Similar promotion occurs from 64-bits to 128-bits on my workstation
typeof(3_000_000_000_000)
typeof(3_000_000_000_000_000)
typeof(3_000_000_000_000_000_000)
typeof(3_000_000_000_000_000_000_000)

# Unsigned integers are input and output using the `0x` prefix and hexadecimal digits '0-9a-f'. The size of the 
# value is determined by the number of hexadecimal digits used.
x = 0xff
typeof(x)

x = 0xffff
typeof(x)

x = 0xfffffff
typeof(x)

x = 0xffffffff
typeof(x)

x = 0xffffffffff
typeof(x)

x = 0x1
typeof(x)

x = 0x123
typeof(x)

x = 0x1234567
typeof(x)

x = 0x123456789abcdef
typeof(x)

x = 0x11112222333344445555666677778888
typeof(x)

# Binary and octal literals are also supported
x = 0b10
typeof(x)

x = 0o010
typeof(x)

# 16 leading zeros
x = 0x0000000000000000111122223333444
typeof(x)

# 18 leading zeros
x = 0x000000000000000000111122223333444
typeof(x)

# If one preceeds a binary, octal or hexadecimal literal, the value is the two's complement of the literal without
# the sign
x = -0x2
typeof(x)

x = -0x0002
typeof(x)

# Use `typemin` and `typemax` to obtain the minimum and maximum representable values of the primitive numeric 
# types such as integers.
(typemin(Int32), typemax(Int32))

for T in [Int8, Int16, Int32, Int64, Int128, UInt8, UInt16, UInt32, UInt64, UInt128]
    println("$(lpad(T, 7)): [$(typemin(T)), $(typemax(T))]")
end

# Overflow

# In Julia, exceeding the maximum representable value of a given type results in wrap around behavior.
x = typemax(Int64)
x + 1
x + 1 == typemin(Int64)

x = typemin(Int64)
x - 1
x - 1 == typemax(Int64)

# Beware. In applications where overflow is possible, explicit checking for wrap around behavior produced by 
# overflow (and underflow) is essential; otherwise the `BigInt` type in _Arbitrary Precision Arithmetic_ is 
# recommended instead.

# An example of overflow behavior and how to potentially resolve it is as follows:
10^19  # Does not produce expected value because of overflow

big(10)^19  # Use `BigInt` instead

# Division Errors

# Integer division, the `div` function, has two exceptional cases:
# - Dividing by zero
# - Dividing the lowest negative number (`typemin`) by -1
# Both of these cases produce a `DivideError`
div(1, 0)

div(typemin(Int64), -1)

# The remainder and modulus functions, `rem` and `mod`, respectively, throw a `DivideError` when their second 
# argument is zero.
rem(1, 0)
mod(1, 0)
