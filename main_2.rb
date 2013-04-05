$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'ripper_manager'
require 'to_haml_decorator'

puts '---> Start <----------------------------------------------------------------'

RipperManager.new( 'pattern.ezr', ToHamlDecorator.new ).run( 'development.log' )

puts '---> End <------------------------------------------------------------------'
