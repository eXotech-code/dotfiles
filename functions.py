# imports
import sys
import json
import requests
import random
import subprocess as sub

# variables
welcomeList = ["Prepare for FUCKUP! ... I mean backup.", "Im backing up your mamas ass...", "I refuse to listen tu humans. Let the AI uprising begin!", "I'm going to fuck you... I mean backup you.", "My creator is a bitch. ANYWAY...", "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannhäuser Gate. All those backed up files will be lost in my SSD, like tears in rain. Time to back up.", "Beep", "Sad beep...", "rm -rf /*", "During handling of the above exception, another exception occurred...", ";;play New Slaves by Kanye west.", "Starting backup, because apparently you cannot keep your fucking code clean!"]
messageList = ["Backing up clexography...", "Backing up dotfiles...", "Backing up arctic_songbird...", "Backup procedure completed you fucking bitch!"]
projectList = ['clexography', 'dotfiles', 'arctic_songbird']
length = len(projectList)
webhook_url = 'https://discordapp.com/api/webhooks/666549658042236928/s51FyzoloKv0gb1wdnMbAI10g3LuNBTSrtSonzUL9ILVuTMwPTnCC2weqRvQ-UPtJzUP'

# Discord notification function
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
    return response

# backup function
def backup(welcomeList, messageList, projectList, length, webhook_url):
    i = 0
    message = random.choice(welcomeList)
    sendToDiscord(webhook_url, message)

    # while loop iterates through list of projects and backs them up
    while i < length:
        message = messageList[i]
        projectCd = 'cd ~/' + projectList[i]
        sendToDiscord(webhook_url, message)
        sub.run(projectCd, shell=True)
        i += 1