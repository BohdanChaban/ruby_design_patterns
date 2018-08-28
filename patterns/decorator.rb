class UltrasGift
  attr_accessor :price

  def price
    25
  end
end

class ScarfUltrasGift
  attr_accessor :price

  def initialize(ultras_gift)
    @ultras_gift = ultras_gift
  end

  def price
    @ultras_gift.price += 10
  end
end

class JerseyUltrasGift
  attr_accessor :price

  def initialize(ultras_gift)
    @ultras_gift = ultras_gift
  end

  def price
    @ultras_gift.price += 50
  end

  def print_name(name)
    print "Jersey with title: #{name}"
  end
end

gift = JerseyUltrasGift.new(ScarfUltrasGift.new(UltrasGift.new))

puts gift.price # 85 // 25 + 10 + 50

puts gift.print_name('Cutrone') # Jersey with title: Cutrone
