class DummyObj
  attr_accessor :i
end

class Main
  def initialize
    @fiber = Fiber.new do
      c = 0
      keep = true
      while keep do
        Fiber.yield c
        obj = (1..10000).map {|i| o = DummyObj.new; o.i = i; o }
        if c >= 100_000_000_000
          keep = false
        end
        c += 1
        # GC.start
      end
    end
  end

  def run
    loop do
      if @fiber.alive?
        @fiber.resume
      else
        return nil
      end
    end
  end
end

Main.new.run
