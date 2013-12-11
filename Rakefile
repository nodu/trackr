require 'octokit'
require 'mongoid'
require 'dotenv'

Dotenv.load

O = Octokit::Client.new :access_token => ENV['GITHUB_TOKEN']

Mongoid.load!("mongoid.yml", :development)

class GithubData
  include Mongoid::Document
  field :name, type: String
  field :contributions, type: Integer
end

namespace :db do
  
  desc 'create mongo collection'
  task :create do
    puts "Creating Mongo Colletion..."
    # db.createCollection('github_dev')
  end

  desc 'Drops the database'
  task :drop do
    puts "Dropping database..."
    GithubData.destroy_all
  end

  desc 'Seeds the database'
  task :seed do
    puts ENV['GITHUB_TOKEN']
    symb_data = O.contributors("chasm/symbiote")

    puts "Seeding database..."
    GithubData.destroy_all
    
    data = []
    symb_data.each do |item|
      data << {name: item.login, contributions: item.contributions}
    end

    github_data = GithubData.create(data)
  end

  desc 'Update the database'
  task :update do
    puts "Updating the database..."
    # if login exits in dB, then update the contributions integer
    # else add the login name / conributions to the GithubData
  end

>>>>>>> Stashed changes
end

  desc 'fetch data from Github'
  task :getgit do
    puts "fetching data from Github..."
    x=Octokit.client.contributors("chasm/symbiote")
  end

  