require "sinatra/base"
require "json"
require 'bundler/setup'
require 'dotenv'
require 'mongoid'
require 'json/ext'

Dotenv.load
Mongoid.load!("mongoid.yml", :development)

#model for mogoid
class GithubData
  include Mongoid::Document
  field :name, type: String
  field :contributions, type: Integer
end


class App < Sinatra::Base

  get '/course' do 
    erb :course
  end

  get '/student' do 
    erb :student
  end

  get '/github' do 
    @data = GithubData.all
    @contrib = []
    
    @data.each do |item|
      @contrib << item.contributions
    end


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