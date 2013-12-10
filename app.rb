require "sinatra/base"
require "json"
require 'octokit'
require 'bundler/setup'
require 'dotenv'
require 'json/ext'

Dotenv.load

class App < Sinatra::Base

  get '/course' do 
    erb :course
  end

  get '/student' do 
    erb :student
  end

  get '/github' do 
    erb :github
  end

  get '/quizilla' do 
    erb :quizilla
  end

  get '/symbiote' do 
    erb :symbiote
  end

  get '/linkedin' do 
    erb :linkedin
  end

  get '/misc' do 
    erb :misc
  end

  get "/" do
    erb :index
  end

  post "/form" do
    "Now you're inside a post request"
  end

end