class DummyObj
  attr_accessor :i
end

class Main
  def initialize
    @fiber = \
      Fiber.new do
        c = 0
        keep = true
        loop do
          obj = (1..10000).map {|i| o = DummyObj.new; o.i = i }
          Fiber.yield c
          if c > 1000000000
            raise "Force exit!!1"
          end
          c += 1
          GC.start
        end
      end

  end

  def run
    loop do
      #@fibers.each do |fib|
      fib = @fiber
        fib.resume if fib.alive?

        if !fib.alive?
          return
        end
      #end
    end
  end
end

Main.new.run
