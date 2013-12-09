require "sinatra/base"
require "json"
require 'octokit'
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


  # before do 
  # #   @repo = Octokit.repo "chasm/symbiote"
  # #   @commit = Octokit.commits("chasm/toddycat", nil, :since => "2012-06-28T00:00:00+00:00").length
  #   @x=Octokit.client.contributors("chasm/symbiote")
    
  #   @student=[]
  #   @data=[]

  #   @x.each do |i|
  #     @student << i.login
  #     @data << i.contributions
  #   end 




  # configure do
  #   conn = MongoClient.new("localhost", 27017)
  #   set :mongo_connection, conn
  #   set :mongo_db, conn.db('test')

  # end

  get '/course' do 
    erb :course
  end

  get '/student' do 
    erb :student
  end

  get '/github' do 
    @git = GithubData.new({name: "Bruno", contributions: 5})
    @git.save
    puts @git

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
    @x = []
    erb :index
  end

  post "/form" do
    "Now you're inside a post request"
  end

end