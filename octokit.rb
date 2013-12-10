client = Octokit::Client.new :access_token => ENV['GITHUB_TOKEN']

user = client.user
user.login

