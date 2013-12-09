require 'octokit'

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

end

  desc 'fetch data from Github'
  task :getgit do
    puts "fetching data from Github..."
    x=Octokit.client.contributors("chasm/symbiote")
  end

  