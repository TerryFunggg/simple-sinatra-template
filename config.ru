=begin
@author: Terry Fung <terryyessfung@gmail.com>
@since:  05 Feb,2021

The config.ru file is use for the application start up.
It will import all the gems that write in Gemfile.

Run command: bundle exec rackup config.ru
=end

require 'rubygems'
# require all the require gems
require 'bundler'
Bundler.require

# for hot reload
#require 'sinatra/reloader'
require 'yaml'

Dir[File.dirname(__FILE__) + '/app/db/*.rb'].each { |f| require f }

# Database Config
config = YAML.load_file('config/database.yml')

# TODO delete it wehen app deploy
ENV["environment"] = 'development'

db = Database.connect(config[ENV["environment"]])

# main app
require './app/app.rb'

run Sinatra::Application
