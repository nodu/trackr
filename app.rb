require "sinatra/base"
require 'bundler/setup'
require 'mongoid'


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
    # @data.each do |x|
    #   puts x.wdi1.contributions
    # end
    # @contrib = []
    # @name = []
    @name_contrib = Hash.new
    
    @data.each do |item|
      # puts "hey joker"
      # puts item.wdi1["group_repos"]["repo1"]["data"][0]['contributions']
      
      item.wdi1["group_repos"]["repo1"]["data"].each do |i|
        # @contrib << i['contributions']
        # @name << i['login']
        @name_contrib["login"] = "contributions"

        puts @name_contrib

      end
      
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