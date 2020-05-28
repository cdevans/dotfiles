#!/bin/sh

echo "Cloning repositories..."

PROJECTS=$HOME/Projects
RSPNDR=$PROJECTS/RSPNDR

CURDIR=$(pwd)

# Personal
git clone git@github.com:cdevans/cde-misc.git $PROJECTS/cde-misc

# RSPNDR
git clone https://github.com/priyankpat/capacitor.git $RSPNDR/capacitor
git clone git@github.com:rspndr/postman-scripts.git $RSPNDR/postman-scripts
git clone git@github.com:rspndr/rspndr-gmail-csv-extractor.git $RSPNDR/rspndr-gmail-csv-extractor

git clone git@github.com:rspndr/rspndr-app.git $RSPNDR/rspndr-app
cd $RSPNDR/rspndr-app
git checkout master && git checkout develop
git flow init -d
npm install

git clone git@github.com:rspndr/rspndr-client.git $RSPNDR/rspndr-client
cd $RSPNDR/rspndr-client
git checkout master && git checkout develop
git flow init -d
npm install

git clone git@github.com:rspndr/rspndr-portal.git $RSPNDR/rspndr-portal
cd $RSPNDR/rspndr-portal
git checkout master && git checkout develop
git flow init -d
npm install

git clone git@github.com:rspndr/rspndr-toolbox.git $RSPNDR/rspndr-toolbox
cd $RSPNDR/rspndr-toolbox
git checkout master && git checkout develop
git flow init -d
npm install

git clone git@github.com:rspndr/rspndr.git $RSPNDR/rspndr
cd $RSPNDR/rspndr
git checkout master && git checkout develop
git flow init -d

git clone git@github.com:rspndr/rspndr-connect.git $RSPNDR/rspndr-connect
cd $RSPNDR/rspndr-connect
git checkout master && git checkout develop
git flow init -d

cd $CURDIR
