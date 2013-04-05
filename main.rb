$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'log_ripper'

puts '---> Start <----------------------------------------------------------------'

log = LogFile.new("development.log")

buffer = 100
log.interval = buffer 
log.backward(buffer)
log.tail(buffer) do |line| 
 puts line unless line =~ /DEPRECATION/
end

lr = LogRipper.new 
lr.on_path( 'CACHE' ) { |t| puts "---> gaga: #{t}" }
lr.run( 'development.log' )


puts '---> End <------------------------------------------------------------------'
