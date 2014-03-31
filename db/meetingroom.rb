require_relative 'db'

class Meetingroom
  @@connection = DB.new
  @@table_name = 'meetingrooms'

  def initialize id, name, size
    @id   = id
    @name = name
    @size = size
  end

  def self.find id
    result = @@connection.query "SELECT * FROM #{@@table_name} WHERE id=#{id}"

    if result.count.eql?(1)
      result.each do |r|
        id   = r["id"]
        name = r["name"]
        size = r["size"]

        return Meetingroom.new id, name, size
      end
    else
      raise "Not Found"
    end
  end

  def to_s
    "#{@id} #{@name} #{@size}"
  end

  def self.all
    results = @@connection.query "SELECT * FROM #{@@table_name}"
  end

  def self.all_string
    results = self.all
    columns = results.fields
    string  = columns.join(', ') + "\n"

    all.each do |row|
      values  = []
      columns.each { |c| values << row[c] }
      string += "#{values.join(' ')}\n"
    end

    string
  end
end
