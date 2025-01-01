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

if [[ ! -d "_recent_feeds" ]] || [[ "$@" =~ "regen" ]]; then
    echo "Generating feed metadata"
    ruby generate_feed_includes.rb
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
    xdg-open "http://localhost:4000" & faketime "$date" bundle exec jekyll serve --trace && fg
else
    faketime "$date" bundle exec jekyll serve --trace
fi