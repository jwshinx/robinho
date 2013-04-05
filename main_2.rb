$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'ez_ripper'

puts '---> Start <----------------------------------------------------------------'

=begin
lr = LogRipper.new do
 on_path( /SQL/ ) { |t| puts "---> gaga: #{t}" }
end
lr.run( 'development.log' )
=end

EzRipper.new( 'pattern.ezr' ).run( 'development.log' )

puts '---> End <------------------------------------------------------------------'
