class Bottles
  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number}".capitalize + " of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action} " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end

  def verses(start, stop)
    start.downto(stop).map { |v| verse(v) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end


class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  class << self
    def for(number)
      begin
        const_get("BottleNumber#{number}")
      rescue NameError
        BottleNumber
      end
    end
  end

  def action
    "Take #{pronoun} down and pass it around,"
  end

  def successor
    BottleNumber.for(number - 1)
  end

  def to_s
    "#{quantity} #{container}"
  end

  private

  def pronoun
    'one'
  end

  def container
    'bottles'
  end

  def quantity
    number.to_s
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def successor
    BottleNumber.for(99)
  end

  def action
    "Go to the store and buy some more,"
  end
end


class BottleNumber1 < BottleNumber
  def pronoun
    'it'
  end

  def container
    'bottle'
  end
end

class BottleNumber6 < BottleNumber
  def container
    'six-pack'
  end

  def quantity
    '1'
  end
end
