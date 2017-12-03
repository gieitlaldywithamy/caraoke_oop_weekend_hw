require_relative("room.rb")
require_relative("guest.rb")
require_relative("song.rb")

@rock = Room.new("thrash around", 4)
@pop_party = Room.new("Sing in the shower", 3)

@rooms = [@rock, @pop_party]
print %x{clear}
puts "Welcome to Caraoke bar management system!".center(50)

user_input = ""

puts "What do you want to do:".rjust(20)
puts "Create a new room"
puts "Add a new song to x room"
puts "Check in a guest"
puts "Check out a guest"
