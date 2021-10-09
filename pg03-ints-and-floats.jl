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

# Floating-point numbers

# Literal floating-point numbers are represented using the "standard" formats using e-notation when necessary:
1.0
typeof(1.0)

1.
typeof(1.)

0.5
typeof(0.5)

.5
typeof(.5)

-1.23
typeof(-1.23)

1e10
typeof(1e10)

2.5e-4
typeof(2.5e-4)

# The previous values are all of type `Float64`. Literal `Float32` values can be entered by writing an `f` in place
# of the `e`
x = 0.5f0
typeof(x)

x = 2.5f-4
typeof(x)

# One **cannot** simply use the `f` suffix
x = 0.5f

# One can easily convert values to `Float32` values
x = Float32(-1.5)
typeof(x)

# Hexadecimal floating-point literals are also valid, but only as `Float64` values, with `p` preceding the base-2 
# exponent. One must understand how `Float64` values are stored using the IEEE standard. See 
# [the Wikipedia article](https://en.wikipedia.org/wiki/Floating-point_arithmetic)
0x1p0

0x1.8p3

x = 0x.4p-1
typeof(x)

# Julia also supports half-precision floating-point numbers (`Float16`); however, they are implemented in software
# and use `Float32` for calculations
sizeof(Float16(4.))

2 * Float16(4.)

# Floating-point zero

# Floating-point numbers have **two** zeros: positive zero and negative zero. They are equal to each other, but 
# actually have different binary representations. The different representations can be seen using the `bitstring`
# function.

0.0 == -0.0

bitstring(0.0)

bitstring(-0.0)

# Special floating-point values
Inf16  ## `Float16` infinity
Inf32  ## `Float32` infinity
Inf  ## `Float64` infinity

-Inf16  ## `Float16` negative infinity
-Inf32  ## `Float32` negative infinity
-Inf  ## `Float64` negative infinity

NaN16  ## `Float16` not a number
NaN32  ## `Float32` not a number
NaN  ## `Float64` not a number

# Comparing these values may not be obvious. See the section, "Numeric Comparisons."

# These special floating-point values, per the _IEEE-754 standard_, are the result of certain arithmetic 
# operations.
1 / Inf

1 / 0

-5 / 0

0.000001 / 0

0 / 0

500 + Inf

500 - Inf

Inf + Inf

Inf - Inf

Inf * Inf

Inf / Inf

0 * Inf

# The `typemin` and `typemax` functions also apply to floating-point types.
(typemin(Float16), typemax(Float16))

(typemin(Float32), typemax(Float32))

(typemin(Float64), typemax(Float64))

# Machine epsilon

# Most real numbers **cannot** be represented with floating-point numbers. For many purposes, it is important to 
# know the distance between two adjacent floating-point numbers. This distance is often known as the 
# "machine epsilon."

# Julia provides `eps`, which gives the distance between 1.0 and the next larger representable floating-point 
# value.
eps(Float32)  # Same as 2.0^-23 as a `Float32` value
Float32(2.0)^-23
eps(Float64)  # Same as 2.0^-52 as a `Float64` value
Float64(2.0^-52)
eps()  # Same as `eps(Float64)`

# The `eps` function also accepts a floating point value. In this situation, the result of `eps()` is the distance
# between the argument to `eps()` and the next (higher) representable floating-point number.
eps(1.0)
eps(1000.)
eps(1e-27)
eps(0.0)

# Note that the distance between two adjacent floating-point values is **not** uniform throughout the 
# floating-point range; instead, floating-point numbers are densest close to 0.0 and grow exponentially sparser as
# one moves away from zero.

# Julia also provides `nextfloat` and `prevfloat` functions that return the next largest or smallest
x = 1.25f0
nextfloat(x)
prevfloat(x)
bitstring(x)
bitstring(nextfloat(x))
bitstring(prevfloat(x))

x = 1.25
nextfloat(x)
prevfloat(x)
bitstring(x)
bitstring(nextfloat(x))
bitstring(prevfloat(x))

# Arbitrary Precision Arithmetic
 
# Julia wraps the _GNU Multiple Precision Arithmetic Library (GMP)_ and the _GNU MPFR Library_, respectively. The 
# `BigInt` and `BigFloat` types are available in Julia for arbitrary precision integer and floating point numbers,
# respectively.

# Use constructors to create these types from either primitive numerical types. Additionally, one can use the 
# _string literal_ `@big_str` or `parse` to construct instances from `AbstractString` values. Values of type 
# `BigInt` can be constructed from integer literals when the exceed the bounds of `Int128`. 

# Note that **no** unsigned arbitrary-precision integer types exist in _Base_; instead, `BigInt` is sufficient in 
# most cases. Additionally, binary, octal and hexadecimal integer literals can be used (in addition to decimal 
# literals).

# Once created, arbitrary-precision integers and floating-point values participate in arithmetic with all other 
# numeric types because of Julia's _type promotion and conversion mechansims_.

BigInt(typemax(Int64)) + 1

big"1234567890123456789012345678901234567890" + 1

parse(BigInt, "123456789012345678901234567890") + 1

string(big"2"^200, base=16)

typeof(0x1000_0000_0000_0000_0000_0000_0000_0000)
typeof(0x1000_0000_0000_0000_0000_0000_0000_0000_0)
0x1000_0000_0000_0000_0000_0000_0000_0000_0 - 1 == typemax(UInt128)
