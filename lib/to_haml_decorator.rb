class ToHamlDecorator
 
 def decorate text
  keyword = text.chomp.split[0]
  case keyword
  when 'Rendered'
   compose_span( text, :red_font )
  when 'SQL'
   compose_span( text, :blue_font )
  else
   compose_span( text, :black_font )
  end
 end
 
 def compose_span text, *arg 
  str = "%span"
  #unless compose_span.nil? || compose_span == ''
  style = ''
  arg.each do |arg| 
   style = compose_style arg 
  end
  str << "{#{style}}" 
  str << " #{text}"
 end

 def compose_style *arg
  str = ":style=>'display:block;"
  arg.each { |arg| str << add_style( arg ) }
  str << "'"
 end

 def add_style arg
  str = ''
  case arg
  when :red_font
   str << red_font
  when :blue_font
   str << blue_font
  when :purple_font
   str << purple_font
  else
   str << black_font
  end
 end

 def red_font; 'color:red;'; end
 def blue_font; 'color:blue;'; end
 def green_font; 'color:green;'; end
 def black_font; 'color:black;'; end

 def generate_complete_render_string
 
 end
end
