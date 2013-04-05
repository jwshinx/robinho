$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'log_ripper'

puts '---> Start <----------------------------------------------------------------'

lr = LogRipper.new do
 on_path( /SQL/ ) { |t| puts "---> gaga: #{t}" }
end
lr.run( 'development.log' )

puts '---> End <------------------------------------------------------------------'
