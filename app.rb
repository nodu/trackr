require "sinatra/base"
require "json"
require 'octokit'
require 'bundler/setup'
require 'dotenv'
Dotenv.load

class App < Sinatra::Base

  before do 
  #   @repo = Octokit.repo "chasm/symbiote"
  #   @commit = Octokit.commits("chasm/toddycat", nil, :since => "2012-06-28T00:00:00+00:00").length
    @x=Octokit.client.contributors("chasm/symbiote")
    
    @student=[]
    @data=[]

    @x.each do |i|
      @student << i.login
      @data << i.contributions
    end 


  end

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