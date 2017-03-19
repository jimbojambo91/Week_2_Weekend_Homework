require_relative('rooms')
require_relative('songs')
require_relative('guests')
require_relative('viewer')

class Runner

  def initialize(viewer)
    @viewer = viewer
    guest_1_name = @viewer.get_guest_name()
    guest_1_money = @viewer.get_guest_money
    @guest_1 = Guest.new(guest_1_name, guest_1_money, "")
    @room_1 = Room.new("The Royal Room",2, 50.00)
    @room_2 = Room.new("Cocobongos",10, 10.00)
    @room_3 = Room.new("The Rock Room",5, 25.00)

    @room_array = [@room_1, @room_2, @room_3]
    

    
  end

  def run()
    choice = @viewer.get_guest_room_selection(@room_array)
    if choice != nil
      choice.check_in_guest(@guest_1)
      print "#{@guest_1.name} has been checked in to #{choice.room_name}"
    end
    
    
    
  
    

  end

end

Runner.new(Viewer.new).run