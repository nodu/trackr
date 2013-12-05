client = Octokit::Client.new :access_token => "<72db4cbb34c75d7de68718ad313db57918a3f864>"

user = client.user
user.login

