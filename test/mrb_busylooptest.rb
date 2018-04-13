##
## BusyloopTest Test
##

assert("BusyloopTest#hello") do
  t = BusyloopTest.new "hello"
  assert_equal("hello", t.hello)
end

assert("BusyloopTest#bye") do
  t = BusyloopTest.new "hello"
  assert_equal("hello bye", t.bye)
end

assert("BusyloopTest.hi") do
  assert_equal("hi!!", BusyloopTest.hi)
end
