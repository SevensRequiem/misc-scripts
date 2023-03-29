import random
import time

responses = ["Yes", "No", "Maybe", "Ask Again Later", "I Don't Know"]

def eight_ball():
    question = input("Ask a question: ")
    print("The 8 ball says:", random.choice(responses))
    time.sleep(1)
    
    while True:
        cont = input("Do you have another question? (Y/N): ")
        if cont.lower() == "n":
            print("Goodbye!")
            break
        elif cont.lower() != "y":
            print("Invalid input. Please enter 'Y' or 'N'.")
        else:
            question = input("Ask another question: ")
            print("The 8 ball says:", random.choice(responses))
            time.sleep(1)

eight_ball()
