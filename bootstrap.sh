#!/usr/bin/env bash

set -e

# Set our working directory
cd /usr/src/app

# Check if we need to create the config file
if [ ! -f "/usr/src/app/config.json" ]; then
	cp /usr/src/app/config.example.json config.json
fi

# Apply our environment variables to the config
jq ".discord_token = "$DISCORD_TOKEN"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".bot_name = "$BOT_NAME"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".bot_prefix = "$BOT_PREFIX"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".bot_channel = "$BOT_CHANNEL"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".discord_pw_key = "$DISCORD_PW_KEY"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".twitter.consumer_key = "$TWITTER_CONSUMER_KEY"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".twitter.consumer_secret = "$TWITTER_CONSUMER_SECRET"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".twitter.access_token = "$TWITTER_ACCESS_TOKEN"" config.json > tmp.$$.json && mv tmp.$$.json config.json
jq ".twitter.access_token_secret = "$TWITTER_ACCESS_TOKEN_SECRET"" config.json > tmp.$$.json && mv tmp.$$.json config.json

# Start the app
/usr/bin/env npm run production
