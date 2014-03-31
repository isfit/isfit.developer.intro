require_relative 'meetingroom'

def main
  puts "All:"
  all_test
  puts "\n\n"

  puts "Id: 1"
  find_test


  puts "\n\n"
  find_not_found_test
end

def all_test
  puts Meetingroom.all_string
end

def find_test
  puts Meetingroom.find(1).to_s
end

def find_not_found_test
  begin
    Meetingroom.find(42)
  rescue RuntimeError => e
    puts "Did not find 42"
    puts e
  end
end

main
