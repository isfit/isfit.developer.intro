require 'rubygems'
require 'mysql2'

class DB
  def initialize
    @client = Mysql2::Client.new(
      host: 'localhost',
      database: 'calendar_app',
      username: 'db_isfit_kurs',
      password: 'isfit<3',
    )
  end

  def query statement
    @client.query statement
  end
end

