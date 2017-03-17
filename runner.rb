require_relative('rooms')
require_relative('songs')
require_relative('guests')
require_relative('viewer')

class Runner

  def initialize(viewer)
    @viewer = viewer
    guest_1_name = @viewer.get_guest_name()
    guest_1_money = @viewer.get_guest_money
    guest_1 = Guest.new(guest_1_name, guest_1_money)
    @room_1 = Room.new("The Royal Room",2, 50)

    
  end

  def run()
    
    
  end

end

Runner.new(Viewer.new).run