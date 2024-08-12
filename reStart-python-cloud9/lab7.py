#Working with Conditionals

#If-else statements

userReply = input("Do you need to ship a package? (Enter yes or no) ").upper()
if userReply == "YES":
    print("We can help you ship the package!")
else: 
    print("Please come back when you need to ship a package. Thank you.")
    

#elif statements
userReply = input("Would you like to buy stamps, buy an envelope, or make a copy? (Enter stamps, envelope, or copy) ").upper()
if userReply == "STAMPS":
    print("We have many stamp designs to choose from.")
elif userReply == "ENVELOPE":
    print("We have many envelope sizes to choose from.")
elif userReply == "COPY":
    copies = input("How many copies would you like? (Enter a number) ")
    print("Here are {} copies.".format(copies))
else:
    print("Thank you, please come again.")
    
    