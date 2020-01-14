#!/bin/sh

curl -X POST -H 'Content-type: application/json' --data '{"text":"Im backing up your mamas ass..."}' https://hooks.slack.com/services/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
~/dotfiles/discord-bot "Im backing up your mamas ass..."
cd ~/clexography
curl -X POST -H 'Content-type: application/json' --data '{"text":"Backing up clexography..."}' https://hooks.slack.com/services/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
~/dotfiles/discord-bot "Backing up clexography..."
git pull
cd ~/dotfiles
curl -X POST -H 'Content-type: application/json' --data '{"text":"Backing up dotfiles..."}' https://hooks.slack.com/services/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
~/dotfiles/discord-bot "Backing up dotfiles..."
git pull
cd ~/arctic_songbird
curl -X POST -H 'Content-type: application/json' --data '{"text":"Backing up arctic_songbird..."}' https://hooks.slack.com/services/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
~/dotfiles/discord-bot "Backing up arctic_songbird..."
git pull
curl -X POST -H 'Content-type: application/json' --data '{"text":"Backup procedure completed you fucking bitch!"}' https://hooks.slack.com/services/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
~/dotfiles/discord-bot "Backup procedure completed you fucking bitch!"