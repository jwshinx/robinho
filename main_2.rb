$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'log_file'
require 'ripper_manager'
require 'to_haml_decorator'

puts '---> Start <----------------------------------------------------------------'

@ripp = RipperManager.new( 'pattern.ezr', ToHamlDecorator.new )
@ripp.run( 'development.log' )

puts '---> Mid <------------------------------------------------------------------'
puts "#{@ripp.render_page}"
puts '---> End <------------------------------------------------------------------'
