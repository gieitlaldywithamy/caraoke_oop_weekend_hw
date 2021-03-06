require('pry')
class Bar

  attr_reader :rooms
  attr_accessor :till

  def initialize(rooms)
    @till = 0
    @rooms = rooms
  end

  def add_money_to_till(cash)
    @till += cash
  end

  def check_in(guest, room)
    if room.enough_space && guest.can_afford(room.entry)
      room.guests.push(guest)
      guest.pay_entry_free(room.entry)
      add_money_to_till(room.entry)
    else
      return "Sorry, no entry"
    end
  end

  def check_out(guest, room)
    room.guests.delete(guest) unless !room.guests.include?(guest)
  end

  def group_check_in(group, room)
    if room.capacity >= group.length() && (group.map{|guest| guest.can_afford(room.entry)}.reduce(:&))
      group.each{|guest| check_in(guest, room)}
    end
  end

  def group_check_out(group, room)
    room.guests.delete_if{|guest| room.guests.include?(guest)}
  end

  def find_most_profitable_room(group)
    #this assumes everyone in the group can afford entry
    #sort rooms by capacity
    rooms_capacity_increasing = @rooms.sort_by{|room| room.capacity}

    # binding.pry
    return rooms_capacity_increasing.find{|room| room.capacity >= group.length() && (group.map{|guest| guest.can_afford(room.entry)}.reduce(:&))}

  end




end
