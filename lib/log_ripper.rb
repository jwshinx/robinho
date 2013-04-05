class LogRipper

 def initialize( &block )
  @path_actions = {}
  #block.call( self ) if block
  instance_eval( &block ) if block
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

