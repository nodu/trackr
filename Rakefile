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

    # SET VARIABLES
    login1 = "chasm"
    name1 = "symbiote"

    # WDI students
    login_gh = [
      "wubr2000",
      "karenzam",
      "godelian",
      "emarnett",
      "yytina",
      "kingsleyman",
      "robss04",
      "sudosoph",
      "stephs829",
      "vbsiqebu",
      "xenos54",
      "chasm",
      "nodu",
      "3dd13"
    ]


    # DOWNLOAD GITHUB DATA FOR GROUP_REPOS
    symb_contrib_data = O.contributors(login1 + "/" + name1)
    symb_commit_data = O.commits(login1 + "/" + name1)
    
    puts "Seeding database..."
    # CLEARS DATABASE
    GithubData.destroy_all
    
    # SETUP DATA MODEL
    data = {
      wdi1: {
        group_repos: {
          repo1: {
            login: login1,
            name: name1,
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

    # DOWNLOAD GITHUB DATA FOR INDIVIDUAL STUDENTS AND SEED DATABASE

    login_gh.each do |student|

      total_repo_count = 0
      user_repos_count = 0
      user_commits_count= 0
      user_watching_count = 0
      user_stars_count = 0

      repo = O.repositories(student, :per_page => 100)
      user_watching_count = O.get("users/" + student + "/subscriptions?per_page=100").length
      user_stars_count = O.get("users/" + student + "/starred?per_page=100").length
      total_repo_count = repo.length
      username = O.user(student).login
      user_gravatar_id = O.get("https://api.github.com/users/" + username).gravatar_id

      repo.each do |item|
        # CHECK TO SEE IF REPO IS EMPTY FIRST
        full_repo_name = item.full_name
        #repo_size = O.get("https://api.github.com/repos/" + full_repo_name).size

        # CHECK IF REPO WAS CREATED BY STUDENT,
        # IF SO THEN COUNT IT AND COUNT COMMITS IN IT
        begin
          if !item.fork
            user_repos_count += 1
            user_commits_count += O.commits(full_repo_name).length
          end
        rescue
          puts "This repo is empty so was not stored: ",full_repo_name
        end

      end

      # STREAKS CALCULATION FOR PAST YEAR
      total_streak = 0
      max_streak = 0
      days_streak = 0

      streak = O.get("https://github.com/users/" + student + "/contributions_calendar_data?per_page=1000?")

      streak.each do |item|
        if item[1] != 0
          total_streak += item[1]
          days_streak += 1
          max_streak = [ max_streak, item[1] ].max
        end
      end

      # SEED INDIVIDUAL STUDENTS
      data[:wdi1][:students] << {
        login: username, 
        gravatar_id: user_gravatar_id,
        user_repos: user_repos_count, 
        user_commits: user_commits_count,
        user_watching: user_watching_count,
        user_starred: user_stars_count,
        user_total_streak: total_streak,
        user_max_streak: max_streak,
        user_streak_days: days_streak 
      }

    end

    # SEED GROUP_REPOS 
    symb_contrib_data.each do |item|
      datahash = {login: item.login, contributions: item.contributions }
      data[:wdi1][:group_repos][:repo1][:data] << datahash
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

  