import requests
import time
import random

webhook_url = "discord webhook here"

while True:
    # Generate a random interval between 5 and 60 seconds
    interval = random.randint(20, 600)
    time.sleep(interval)
    
    # Send a message to the webhook
    data = {
        "content": "<@395786928697638922> meow"
    }
    response = requests.post(webhook_url, json=data)
    
    # Check if the message was successfully sent
    if response.status_code != 204:
        print("Failed to send message to webhook.")
