class DummyObj
  attr_accessor :i
end

class Main
  def initialize
  end

  def make_big_obj
    (1..10000).map {|i| o = DummyObj.new; o.i = i; o }
  end

  def run
    100_000_000_000.times do
      obj = make_big_obj
      fibs = (0..4).map do |j|
        Fiber.new do
          Fiber.yield obj[j].i
        end
      end
      fibs.each{|f| f.resume }
    end
  end
end

Main.new.run
