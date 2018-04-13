class DummyObj
  attr_accessor :i
end

class Main
  def initialize
    @fibers = (1..3).map do |i|
      Fiber.new do
        c = 0
        keep = true
        while keep do
          Fiber.yield c
          obj = (1..10000).map {|i| o = DummyObj.new; o.i = i }
          if c > i * 1000000000
            keep = false
          end
          c += 1
          # GC.start
        end
      end
    end
  end

  def run
    loop do
      @fibers.each do |fib|
        fib.resume if fib.alive?

        if @fibers.all?{|f| !f.alive? }
          return
        end
      end
    end
  end
end

Main.new.run
