#!/usr/bin/env python3

# imports
import welcome
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

# setup for sendToDiscord
webhook_url = 'https://discordapp.com/api/webhooks/666549658042236928/s51FyzoloKv0gb1wdnMbAI10g3LuNBTSrtSonzUL9ILVuTMwPTnCC2weqRvQ-UPtJzUP'

while True:
    message = random.choice(welcome.welcomeList)
    sendToDiscord(webhook_url, message)