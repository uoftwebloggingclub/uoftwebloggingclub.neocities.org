#!/bin/bash
if [[ ! $(ruby --version) ]]; then 
    echo "Ruby not installed!"
    exit
elif [[ ! $(bundle --version) ]]; then
    echo "Bundle not installed!"
    exit
else
    echo "Ruby and Bundle installed!"
fi

bundle check &> /dev/null

if [[ $? = '1' ]]; then
    bundle install
else
    echo "All gems installed!"
fi

if [[ ! -d "_recent_feeds" ]]; then
    echo "Generating feed metadata"
    ruby generate_feed_includes.rb
else
    echo "Feed data found!"
fi

# See https://github.com/jitinnair1/gradfolio/wiki/Local-Development
xdg-open "http://localhost:4000" & bundle exec jekyll serve --trace && fg