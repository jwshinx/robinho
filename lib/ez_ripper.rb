require 'log_ripper'

class EzRipper

 def initialize( pattern_file )
  @r = LogRipper.new
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
  #@r.on_path( Regexp.new(pattern.chomp) ) { |e| puts "---> ohoh: #{e}" }
  @r.on_path( /#{pattern.chomp}/ ) { |e| puts e }
 end

end
  
   
   
