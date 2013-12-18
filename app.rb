require "sinatra/base"
require 'bundler/setup'
require 'mongoid'
require 'json/ext'


Mongoid.load!("mongoid.yml", :development)


#model for mogoid
class GithubData
  include Mongoid::Document
  field :name, type: String
  field :contributions, type: Integer
end

class App < Sinatra::Base

  ['/github', '/student'].each do |path|
    before path do
      @data = GithubData.all
      # @data.each do |x|
      #   puts x.wdi1.contributions
      # end
      # @contrib = []
      # @name = []
      @contrib = []
      @students_data=[]
      
      @data.each do |item|
        # puts "hey joker"
        # puts item.wdi1["group_repos"]["repo1"]["data"][0]['contributions']
        
        item.wdi1["group_repos"]["repo1"]["data"].each do |i|
          # @contrib << i['contributions']
          # @name << i['login']
          @contrib << {login: i["login"], contributions: i["contributions"]}

        end
        
        puts item.wdi1["students"][1]["login"]
        item.wdi1["students"].each do |i|
          #puts i["login"], i["gravatar_id"], i["user_repos"]
          @students_data << { 
            login: i["login"], 
            gravatar_id: i["gravatar_id"], 
            user_repos: i["user_repos"], 
            user_commits: i["user_commits"],
            user_watching: i["user_watching"],
            user_starred: i["user_starred"],
            user_total_streak: i["user_total_streak"],
            user_max_streak: i["user_max_streak"],
            user_streak_days: i["user_streak_days"]
          }
        end

        
      end
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