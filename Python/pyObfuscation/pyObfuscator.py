#!/usr/bin/env python

# # Preparation
# ## setting environment
# // importing...
import string
import random

# ### setting variables
# // setting Goal
goal = "start C:/WINDOWS/System32/calc.exe"

# // array to save randoms
randoms = []

# // set characters to save
character_set = string.printable
bad_chars = ";<>^`"
for bad in bad_chars:
    character_set = character_set.replace(bad, "")

# ## defining function to create random strings
def get_random_mess(min_len=5, max_len=10):
    global randoms

    while True:
        rand = "".join([ random.choice(string.ascii_lowercase) for _ in range(random.randrange(min_len,max_len)) ])
        if rand not in randoms:
            randoms.append(rand)
            return rand

# ## Operators for batch script
set_operater = get_random_mess()
space_character = get_random_mess()
equals_character = get_random_mess()

# // set operators in script
prologue = [
    f"set {set_operater}=set",
    f"%{set_operater}% {space_character}= ",
    f"%{set_operater}%%{space_character}%{equals_character}==",
]

# # Creating variables for characters

# ## Create variable function
def create_variable(varname, value):
    return f"%{set_operater}%%{space_character}%{varname}%{equals_character}%{value}"

# ## values to hold variable information
# // alphabet holds variables and their names
alphabet = {}

var_settings = []

# // Setting the values for their characters
# for char in character_set:
for char in goal:
    varname = get_random_mess()
    value = char
    var_settings.append(create_variable(varname, value))
    alphabet[value] = varname


# # Execution

# // execute is the goal string in its variable name counterparts
execute = ["".join([f"%{alphabet[char]}%" for char in goal ])]


# // code holds all the arrays entered into the batch file
code = [] + prologue + var_settings + execute
final_code = "\n".join(code)

# // execution
with open("payload.bat", "w+") as handle:
    handle.write(final_code)
