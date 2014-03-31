require_relative 'db'

class Meetingroom
  def initialize
    @connection = DB.new
    @columns    = [
      "id",
      "name",
      "size",
    ]
  end

  def all
    results = @connection.query "SELECT * FROM meetingrooms"
  end

  def puts_all
    all.each do |row|
      @columns.each do |c|
        print "#{row[c]} "
      end
      puts ""
    end
  end
end

Meetingroom.new.puts_all
