class EzRipper

 def initialize( program_path )
  @r = XmlRipper.new
  parse_program( program_path )
 end

 def run( xml_file )
  @r.run( xml_file )
 end

 def parse_program( program_path )
  File.open( program_path ) do |f|
   until f.eof?
    parse_statement( f.readline )
   end
  end
 end

 def parse_statement( statement )
  tokens = statement.strip.split
  return if tokens.empty?

  case tokens.first
  when '#'
   # dont do anything bc its a comment
  when 'print'
   raise "Expected print <xpath>" unless tokens.size == 2
   @r.on_path( tokens[1] ) { |e| puts e.text }
  when 'delete'
   raise "Expected delete <xpath>" unless tokens.size == 2
   @r.on_path( tokens[1] ) { |e| e.remove }
  when 'replace'
   raise "Expected replace <xpath> <value>" unless tokens.size == 3
   @r.on_path( tokens[1] ) { |e| e.text = tokens[2] }
  when 'uppercase'
   raise "Expected uppercase <xpath>" unless tokens.size == 2 
   @r.on_path( tokens[1] ) { |e| e.text = e.text.upcase }
  when 'print_document'
   raise "Expected print_document" unless tokens.size == 1 
   @r.after { |doc| puts doc }
  else
   raise "Unknown keyword: #{tokens.first}"
  end
 end

end
  
   
   
