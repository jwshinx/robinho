$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'ripper_manager'

puts '---> Start <----------------------------------------------------------------'

RipperManager.new( 'pattern.ezr' ).run( 'development.log' )

puts '---> End <------------------------------------------------------------------'
