require_relative 'user'
require 'Date'

class Messages
  def self.create(user_id:, message:, date:, time: )
    db_env_connection

    result = @@connection.exec_params("INSERT INTO Messages (user_id, message, date, time) VALUES($1, $2, $3, $4) RETURNING id, user_id, message;", [user_id, message, date, time])
    Messages.new(id: result[0]['id'], user_id: result[0]['user_id'], message: result[0]['message'])

  end

  attr_reader :id, :user_id, :message

  def initialize(id:, user_id:, message:)
    @id = id
    @user_id = user_id
    @message = message
  end

  def self.all
    db_env_connection

    result = @@connection.exec_params("SELECT Messages.message, Messages.date, Messages.time, Username.username 
      FROM Messages 
      INNER JOIN Username ON Username.id = Messages.user_id ORDER BY username;")

  end

  private

  def self.db_env_connection

    if ENV['ENVIRONMENT'] == "test"
      @@connection = PG.connect(dbname: 'chitter_test')
    else
      @@connection = PG.connect(dbname: 'chitter')
    end

  end

end