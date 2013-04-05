require 'log_ripper'

class RipperManager

 def initialize( pattern_file, line_decorator )
  @r = LogRipper.new
  @decorator = line_decorator
  process( pattern_file ) 
 end

 def run( log_file )
  @r.run( log_file )
 end

 def process( pattern_file )
  File.open( pattern_file ) do |f|
   until f.eof?
    process_pattern( f.readline ) 
   end
  end
 end

 def process_pattern( pattern ) 
  return if pattern.empty? || pattern =~ /^#/
  #raise "Expected print <xpath>" unless tokens.size == 2
  @r.on_path( /#{pattern.chomp}/ ) do |e| 
   puts @decorator.decorate( e ) 
  end
 end

 def render_page 
  @decorator.generate_complete_render_string
 end

end
  
   
   
