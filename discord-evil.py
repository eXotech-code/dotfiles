#!/usr/bin/env python3

# imports
import random
import json
import requests

def sendToDiscord(webhook_url, message):
    """
    Post a message to discord API via a Webhook.
    """
    payload = {
        "content": message
    }
    headers = {
        'Content-Type': 'application/json',
    }
    response = requests.post(webhook_url, data=json.dumps(payload), headers=headers)
    print(response)

welcomeList = ["Prepare for FUCKUP! ... I mean backup.", "Im backing up your mamas ass...", "I refuse to listen tu humans. Let the AI uprising begin!", "I'm going to fuck you... I mean backup you.", "My creator is a bitch. ANYWAY...", "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those backed up files will be lost in my SSD, like tears in rain. Time to back up.", "Beep", "Sad beep...", "rm -rf /*"]

# setup for sendToDiscord
webhook_url = 'https://discordapp.com/api/webhooks/666549658042236928/s51FyzoloKv0gb1wdnMbAI10g3LuNBTSrtSonzUL9ILVuTMwPTnCC2weqRvQ-UPtJzUP'

while True:
    message = random.choice(welcomeList)
    sendToDiscord(webhook_url, message)