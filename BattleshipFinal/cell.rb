class Cell
  attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(type)
    @ship = type
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if empty? == false
      @ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end
  end

  def render(view = nil)
    if view == true && empty? == false && fired_upon? == false
      "\u{1F6A2}"
    elsif fired_upon? == false
      "\u{1F30A}"
    elsif fired_upon? == true && empty? == true
      "\u{1F4A8}"
    elsif @ship.sunk? == true && fired_upon? == true
      "\u{1F480}"
    elsif fired_upon? == true && empty? == false
      "\u{1F4A5}"
    end
  end

end
