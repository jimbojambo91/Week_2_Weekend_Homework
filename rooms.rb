require('pry')
class Room

  attr_reader( :room_name, :guests, :playlist, :capacity, :entry_fee)

  def initialize(room_name, capacity, entry_fee)
    @guests = []
    @playlist = []
    @capacity = capacity
    @entry_fee = entry_fee
    @room_name = room_name
  end

  def check_in_guest(guest)
    if @guests.length < @capacity
      if guest.money >= @entry_fee
        guest.money -= @entry_fee
        @guests << guest
      else 
        return "Not tonight mate"
      end
    else
      return "Sorry, Room is full"
    end
  end

  def check_guest_is_in_room(guest_looking_for)
    @guests.find{|guest| if guest == guest_looking_for
      return guest.name
    end}
    
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  def remove_song_from_playlist(song)
    @playlist.delete(song)
  end

end