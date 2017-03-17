class Viewer

  def get_guest_name
    puts "Hey Buddy, What's your name"
    return gets.chomp
  end

  def get_guest_money
    puts "To get in tonight, you are gonna need some money. How much you got?"
    return gets.chomp
  end

  def get_guest_room_selection
    puts "Which room would you like to visit? We have the following: #{@room_1.room_name} which costs £#{@room_1.entry_fee}"
    return gets.chomp
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