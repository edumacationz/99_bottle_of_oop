class Bottles
  def verse(bottles)
      <<-VERSE
#{ first_half(bottles).capitalize } of beer on the wall, #{ first_half(bottles) } of beer.
#{ last_half(bottles) }
      VERSE
  end

  def verses(start, stop)
    start.downto(stop).map { |v| verse(v) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def first_half(bottles)
    pluralize(bottles.zero? ? 'no more' : bottles)
  end

  def last_half(bottles)
    if bottles.zero?
      go_to_the_store
    else
      "Take #{ take(bottles) } down and pass it around, #{ remainder(bottles - 1) }"
    end
  end

  def remainder(bottles)
    "#{ first_half(bottles) } of beer on the wall."
  end

  def go_to_the_store
    "Go to the store and buy some more, #{ remainder(99) }"
  end

  def pluralize(bottles)
    "#{bottles} #{ plural?(bottles) ? 'bottles' : 'bottle' }"
  end

  def take(bottles)
    plural?(bottles) ? 'one' : 'it'
  end

  def plural?(value)
    value.to_i != 1
  end
end
