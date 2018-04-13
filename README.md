# mruby-fiber-busyloop-test   [![Build Status](https://travis-ci.org/udzura/mruby-fiber-busyloop-test.svg?branch=master)](https://travis-ci.org/udzura/mruby-fiber-busyloop-test)
BusyloopTest class
## install by mrbgems
- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'udzura/mruby-fiber-busyloop-test'
end
```
## example
```ruby
p BusyloopTest.hi
#=> "hi!!"
t = BusyloopTest.new "hello"
p t.hello
#=> "hello"
p t.bye
#=> "hello bye"
```

## License
under the MIT License:
- see LICENSE file
