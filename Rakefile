require 'octokit'
require 'mongoid'

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
    symb_data =Octokit.client.contributors("chasm/symbiote")
    puts "Seeding database..."
    GithubData.destroy_all
    
    data = []
    symb_data.each do |item|
      data << {name: item.login, contributions: item.contributions}
    end

    github_data = GithubData.create(data)
  end

end

  desc 'fetch data from Github'
  task :getgit do
    puts "fetching data from Github..."
    x=Octokit.client.contributors("chasm/symbiote")
  end

  