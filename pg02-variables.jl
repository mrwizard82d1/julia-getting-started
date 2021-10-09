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

# Unicode names (in UTF-8 encoding) are allowed
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

# Allowed variable names
#
# Variables start with many Unicode code points in specific categories:
#
# - Lu (uppercase letter)
# - Ll (lowercase letter)
# - Lt 
# - Lm
# - Lo
# - Nl (letters (numbers))
#
# - Sc / So currency and other symbols
# - A few other letter-like characters; for example, a subset of the Sm math symbols
#
# Subsequent characters include ! and digits (0-9 and other characters in categories Nd/No), as well as other
# Unicode code points:
# - Diacritics and other modifying marks (categories Mn/Mc/Me/Sk)
# - Some punctuation connectors (category Pc)
# - Primes
# - A few other characters

# Operators like `+` are also valid identifiers, but are parsed specially.

# The only explicitly disallowed names for variables are the names of the built-in `keywords`:

# else = false
# try = "No"

# Stylistic conventions for variable names
#
# - Names of variables are in lower case
# - Word separation can be indicated by underscore ('_'), but the use of underscores is **discouraged** unless 
#   the name would be hard to read otherwise
# - Names of `Type`s and `Module`s begin with a capital letter and word separation is shown with upper camel case
#   instead of underscores (PascalCase)
# - Names of `functions` and `macros` are in lower case **without** underscores
# - Functions that mutate their arguments have names that end in '!'. 
#
# For more information, see the Style Guide.

