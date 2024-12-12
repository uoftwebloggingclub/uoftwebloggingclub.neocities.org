#!/bin/bash
if [[ ! $(ruby --version) ]]; then 
    echo "Ruby not installed!"
elif [[ ! $(bundle --version) ]]; then
    echo "Bundle not installed!"
fi

if [[ ! $(bundle check) ]]; then
    bundle install
fi

if [[ ! -d "_recent_feeds" ]]; then
    echo "Generating feed metadata"
    ruby generate_feed_includes.rb
fi

# See https://github.com/jitinnair1/gradfolio/wiki/Local-Development
bundle exec jekyll serve --trace