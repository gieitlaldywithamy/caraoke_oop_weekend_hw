require_relative("room.rb")
require_relative("guest.rb")
require_relative("song.rb")
require_relative("bar.rb")
@rock = Room.new("Thrash around", 4)
@pop_party = Room.new("Pop party", 3)
@rap_off = Room.new("Rap off", 2)

@rooms = [@rock, @pop_party, @rap_off]

@bar = Bar.new(@rooms)
print %x{clear}

user_input = ""

banner = "
░█▀▀█ ─█▀▀█ ░█▀▀█ ─█▀▀█ ░█▀▀▀█ ░█─▄▀ ░█▀▀▀ 　 ░█──░█ ▄█─
░█─── ░█▄▄█ ░█▄▄▀ ░█▄▄█ ░█──░█ ░█▀▄─ ░█▀▀▀ 　 ─░█░█─ ─█─
░█▄▄█ ░█─░█ ░█─░█ ░█─░█ ░█▄▄▄█ ░█─░█ ░█▄▄▄ 　 ──▀▄▀─ ▄█▄
"
def print_rooms()
  format = '%-25s %-15s %-15s %-15s %-15s'
  puts format % ['Name','Guests', 'Capacity', 'Entry', 'Playlist']
  @bar.rooms.each do |room|
  puts format % [room.room_name, room.guest_names(), room.capacity, room.entry, room.playlist ]
end
end


puts banner
while user_input != "quit"
  puts "What do you want to do:"
  puts "1 - List rooms"
  puts "2 - Check till"
  puts "3 - Check in a new group"
  puts "quit"

  user_input = gets.chomp

  case user_input
  when "1"
      print_rooms()
  when "2"
      p "Till: £#{@bar.till}"
  when "3"
      puts "How many are in the party?"
      number_of_customers = gets.chomp.to_i()
      i = 1

      customer_group = []
      while i <= number_of_customers
        puts "Name #{i} please..."
        name = gets.chomp
        customer_group.push(Guest.new(name))
        i += 1
      end

      suggested_room = @bar.find_most_profitable_room(customer_group)
      puts "Booking group into #{suggested_room.room_name}"
      if customer_group.length > 1
        @bar.group_check_in(customer_group, suggested_room)
      else
        @bar.check_in(customer_group[0], suggested_room)
      end

  end


end
