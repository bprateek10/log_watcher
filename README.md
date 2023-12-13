# Log Watcher

A Web Application built on Ruby on Rails to tail a file on the server

# Installation Steps

## Step 1 - Install prerequisites

Install Ruby-3.2.2

    $ rvm install 3.2.2
Install Redis

    $ sudo apt-get update
    $ sudo apt-get install redis

## Step 2 - Clone the Repository

    $ git clone https://github.com/bprateek10/online-forum.git
    $ cd online-forum

## Step 3 - Bundle

Run following commands on terminal in your root directory

    $ gem install bundler
    $ bundle install

## Step 4 - Run rails server & sidekiq

    $ foreman start

## Step 5 - Testing
For testing purpose, I have put the test_file.txt. After starting the server, to tail the file go to http://localhost:3000/logs. You will start seeing the content of test_file on the browser. Update the test_file and the changes should reflect on the browser. 

If you want to map the app to any other file, you can do by changing the const FILE value in constants.rb inside initializers


