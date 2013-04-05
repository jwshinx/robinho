class LogRipper

 def initialize( &block )
  @path_actions = {}
  block.call( self ) if block
 end

 def on_path( path, &block )
  @path_actions[path] = block 
 end

 def run( file )
  File.open( file ) do |f|
   tailed_file = LogFile.new(file) 
   run_path_actions( tailed_file )
   #@before_action.call( tailed_file )
   #run_path_actions( tailed_file )
   #@after_action.call( tailed_file )
  end
 end

 def run_path_actions( tailed_file )
  @path_actions.each do |pattern, block|
   buffer = 100
   tailed_file.interval = buffer 
   tailed_file.backward(buffer) 
   tailed_file.tail(buffer) do |line|
    block.call( line ) if line =~ pattern 
   end
  end
 end

end

=begin
require "rexml/document"

class XmlRipper

 def initialize( &block )
  @before_action = proc {}
  @path_actions = {}
  @after_action = proc {}
  instance_eval( &block ) if block
 end

 def initialize_from_file( path )
  instance_eval( File.read( path ), path )
 end

 def method_missing( name, *args,  &block )
  return super unless name.to_s =~ /on_.*/
  parts = name.to_s.split( "_" )
  parts.shift
  xpath = parts.join( '/' )
  on_path( xpath, &block )
 end
 
 def on_path( path, &block )
  @path_actions[path] = block 
 end

 def before( &block )
  @before_action = block
 end

 def after( &block )
  @after_action = block
 end

 def run( xml_file_path )
  File.open( xml_file_path ) do |f|
   document = REXML::Document.new(f)
   @before_action.call( document )
   run_path_actions( document )
   @after_action.call( document )
  end
 end

 def run_path_actions( document )
  @path_actions.each do |path, block|
   REXML::XPath.each(document, path) do |e|
    block.call( e )
   end
  end
 end

 def to_s 
  'xml-ripper'
 end
end
=end
