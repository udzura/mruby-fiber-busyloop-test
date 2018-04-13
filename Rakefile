MRUBY_CONFIG=File.expand_path(ENV["MRUBY_CONFIG"] || "build_config.rb")

file :mrubymaster do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git mrubymaster"
end

file :mruby14 do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git mruby14"
  Dir.chdir 'mruby14' do
    sh "git fetch --tags"
    rev = %x{git rev-parse 1.4.0}
    sh "git checkout #{rev}"
  end
end

file :mruby13 do
  sh "git clone --depth=1 git://github.com/mruby/mruby.git mruby13"
  Dir.chdir 'mruby13' do
    sh "git fetch --tags"
    rev = %x{git rev-parse 1.3.0}
    sh "git checkout #{rev}"
  end
end

%i(mrubymaster mruby14 mruby13).each do |mruby|
  desc "compile binary #{mruby}"
  task "#{mruby}:compile" => mruby do
    sh "cd #{mruby} && rake all MRUBY_CONFIG=#{MRUBY_CONFIG}"
  end

  desc "test #{mruby}"
  task "#{mruby}:test" => mruby do
    sh "cd #{mruby} && rake all test MRUBY_CONFIG=#{MRUBY_CONFIG}"
  end

  desc "cleanup #{mruby}"
  task "#{mruby}:clean" => mruby do
    exit 0 unless File.directory?(mruby)
    sh "cd #{mruby} && rake deep_clean"
  end
end

task :default => "mruby14:compile"
