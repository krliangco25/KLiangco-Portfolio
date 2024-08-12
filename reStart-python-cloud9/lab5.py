#Categorizing Values

#Creating a mixed-type list

myMixedTypeList = [45, 290578, 1.02, True, "My dog is on the bed.", "45"]

#using for loop to print every element and their type
for item in myMixedTypeList:
    print("{} is of data type {}".format(item, type(item)))
    