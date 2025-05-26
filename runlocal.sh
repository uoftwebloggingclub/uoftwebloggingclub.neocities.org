#!/bin/bash

if [[ ! $(ruby --version) ]]; then 
    echo "Ruby not installed!"
    exit
elif [[ ! $(bundle --version) ]]; then
    echo "Bundle not installed!"
    exit
elif [[ ! $(faketime --version) ]]; then
    echo "faketime not installed!"
    exit
else
    echo "All dependencies installed!"
fi

bundle check &> /dev/null

if [[ $? = '1' ]]; then
    bundle install
else
    echo "All gems installed!"
fi

# Fetch rss feed from rss-combine
bash scripts/fetch_rss.sh

if [[ ! -f "_data/feed.json" ]] || [[ ! -f "_data/members.json" ]] || [[ "$@" =~ "regen" ]]; then
    echo "Generating metadata"
    ruby scripts/generate_feed_json.rb
    ruby scripts/generate_member_json.rb
else
    echo "Feed data found!"
fi

if [[ "$@" =~ "christmas" ]]; then
    date="dec 25"
elif [[ "$@" =~ "newyears" ]]; then
    date="jan 1"
else
    date="$(date)"
fi

# See https://github.com/jitinnair1/gradfolio/wiki/Local-Development
if [[ "$@" =~ "browser" ]]; then
    xdg-open "http://localhost:4000" & faketime "$date" bundle exec jekyll serve serve --host 0.0.0.0 --trace && fg
else
    faketime "$date" bundle exec jekyll serve --host 0.0.0.0 --trace
fi
