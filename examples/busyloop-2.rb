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
      fib = Fiber.new do
        Fiber.yield obj[0].i
      end
      fib.resume
    end
  end
end

Main.new.run
