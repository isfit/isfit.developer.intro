require_relative 'meetingroom'

def main
	all_test
	find_test
	find_not_found_test
end

def all_test
	puts "All:\n"
  puts Meetingroom.all_string
end

def find_test
  puts "\n\nId: 1\n"
  puts Meetingroom.find(1).to_s
end

def find_not_found_test
	begin
    Meetingroom.find(42)
	rescue RuntimeError => e
		puts "\n\nDid not find 42"
		puts e
	end
end

main
