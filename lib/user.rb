require 'pg'

class User
  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO Username (username, password) VALUES($1, $2) RETURNING id, username;", [username, password])
    User.new(id: result[0]['id'], username: result[0]['username'])

  end

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end