# This is an explanation of pyObfuscator.py

# Preparation

## setting environment

 importing...

```Python
import string

import random
```
### setting variables

 setting Goal

```Python
goal = "start C:/WINDOWS/System32/calc.exe"
```
 array to save randoms

```Python
randoms = []
```
 set characters to save

```Python
character_set = string.printable

bad_chars = ";<>^`"

for bad in bad_chars:

    character_set = character_set.replace(bad, "")
```
## defining function to create random strings

```Python
def get_random_mess(min_len=5, max_len=10):

    global randoms



    while True:

        rand = "".join([ random.choice(string.ascii_lowercase) for _ in range(random.randrange(min_len,max_len)) ])

        if rand not in randoms:

            randoms.append(rand)

            return rand
```
## Operators for batch script

```Python
set_operater = get_random_mess()

space_character = get_random_mess()

equals_character = get_random_mess()
```
 set operators in script

```Python
prologue = [

    f"set {set_operater}=set",

    f"%{set_operater}% {space_character}= ",

    f"%{set_operater}%%{space_character}%{equals_character}==",

]
```
# Creating variables for characters

## Create variable function

```Python
def create_variable(varname, value):

    return f"%{set_operater}%%{space_character}%{varname}%{equals_character}%{value}"
```
## values to hold variable information

 alphabet holds variables and their names

```Python
alphabet = {}

var_settings = []
```
 Setting the values for their characters

```Python
for char in goal:

    varname = get_random_mess()

    value = char

    var_settings.append(create_variable(varname, value))

    alphabet[value] = varname
```
# Execution

 execute is the goal string in its variable name counterparts

```Python
execute = ["".join([f"%{alphabet[char]}%" for char in goal ])]
```
 code holds all the arrays entered into the batch file

```Python
code = [] + prologue + var_settings + execute

final_code = "\n".join(code)
```
 execution

```Python
print(final_code)

    # handle.write(final_code)
```
