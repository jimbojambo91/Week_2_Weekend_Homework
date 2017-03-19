class Viewer

  def get_guest_name
    puts "Good evening, what's your name?"
    return gets.chomp
  end

  def get_guest_money
    puts "To get in tonight, you are gonna need some money. How much you got?"
    return gets.chomp.to_f
  end

  def get_guest_room_selection(room_arr)
    puts "Which room would you like to visit? We have the following:"
    for rooms in room_arr
    puts "#{rooms.room_name} which costs £#{rooms.entry_fee}."
    end
    puts "Please type your selection:"
    room_choice = gets.chomp.downcase
    for rooms in room_arr
      if rooms.room_name.downcase == room_choice
        return rooms
      end
    end
    print "That is not a valid choice"
    return false
  end

end

#   def start(player_name)
#     puts
#     puts "#{player_name} roll!"
#     gets.chomp
#   end

#   def show_update(entry)
#     puts "#{entry.player.name} rolled #{entry.roll}"
#     if(entry.modifier != 0)
#       puts "#{entry.player.name} hit a #{entry.modifier_type}! Moves #{entry.modifier}"
#     end
#     puts "#{entry.player.name} is on tile #{entry.player.position}"
#   end

#   def end(winner_name)
#     puts "Congratulations, #{winner_name} wins"
#   end
# end