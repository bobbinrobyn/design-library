#!/bin/bash

#########################
## Adapted from https://gist.github.com/domenic/ec8b0fc8ab45f39403dd
#########################
set -e # exit with nonzero exit code if anything fails

if [ "$TRAVIS_BRANCH" = "master" ]
  then
    # Copy goodies from .www to www (build folder)
    cp -r .www/ www/
    # Move to build folder and init it
    cd www
    git init

    # Configure Git
    git config user.name "Travis CI"
    git config user.email "travis@watson.ibm"

    # Commit all the things into the repo
    git add .
    git commit -m "Deploy to GitHub Pages"

    # Force push to gh-pages
    git push --force --quite "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
fi