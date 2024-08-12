#Working with Loops
#importing number randomization
import random 

print("Welcome to Guess the Number!")
print("The rules are simple. I will think of a number, and you will try to guess it.")

#integer randomizer from 1-10
number = random.randint(1,10)

Guess = False

while Guess !=True: 
    answer = input("Guess a number between 1 and 10: ")
    if int(answer) == number: 
        print("you guessed {}. That is correct: You win!".format(answer))
        Guess = True
    else: 
        print("You guessed {}. Sorry, that isn't it. Try again.".format(answer))
        
        