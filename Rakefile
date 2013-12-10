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
    symb_contrib_data = O.contributors("chasm/symbiote")
    symb_commit_data = O.commits('chasm/symbiote')
    puts "Seeding database..."
    GithubData.destroy_all
    
    data = {
      wdi1: {
        group_repos: {
          repo1: {
            data: [],
            },
          repo2: {},
          repo3: {}
        },
        class_data: {
          quizzes: {}
        },
        students: []
      }
    }

    symb_contrib_data.each do |item|
      data[:wdi1][:group_repos][:repo1][:login]=item.login
      data[:wdi1][:group_repos][:repo1][:contributions]=item.contributions
    end

    symb_commit_data.each do |item|
      data[:wdi1][:group_repos][:repo1][:commits]=item.count
    end

    github_data = GithubData.create(data)
  end

  desc 'Update the database'
  task :update do
    puts "Updating the database..."
    # if login exits in dB, then update the contributions integer
    # else add the login name / conributions to the GithubData
  end

end

  desc 'fetch data from Github'
  task :getgit do
    puts "fetching data from Github..."
    x=Octokit.client.contributors("chasm/symbiote")
  end

  