client = Octokit::Client.new :access_token => "1bd824b0edefe72389e89bc86a44efa4326fbd44"

user = client.user
user.login

