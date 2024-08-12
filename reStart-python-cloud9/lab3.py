myString = "This is a string."
print(myString)

print(type(myString))
print(myString + " is of data type "  + str(type(myString)))

#concatinating striings

first = "water"
second = "fall"
third = first + second
print(third)

#input strings
name = input("What is your name? ")
print(name)

#Formatting output strings
color = input("What is your favorite color? ")
animal = input("What is your favorite animal? ")

print("{}, you like a {} {}!".format(name,color,animal))

