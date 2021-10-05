# Assign the value 10 to the variable `x`
x = 10

# Doing math with the value of `x`
x + 1

# Reassign the value of `x`
x = 1 + 1

# Assign a value of a new **type** to `x`
x = "Hello, Julia World!"

# Flexible variable naming
x = 1.0

y = -3

Z = "My string"

customary_phrase = "Hello, Julia World!"

DeclarationOfIndependenceSelfEvidentTruths = "Wir halten diese Wahrheiten für selbstverständlich, dass alle Menschen gleich geschaffen sind, dass sie von ihrem Schöpfer mit bestimmen unveräußerlichen Rechten ausgestattet sind, darunter Leben, Freiheit and das Streben nach Glück."

δ = 0.00001

selbstverständlich = "self-evident"

# Although one can redefine built-in constants and functions if necessary, it is **not** recommended to avoid 
# potential confusion
#
# pi = 3
#
# pi  # prints "3"
#
# sqrt = 4  # changes the `sqrt` function

# If a built-in constant or function is already in use, Julia will report an error if you try to redefine it.
pi

pi = 3

sqrt(100)

sqrt = 4