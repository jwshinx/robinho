class ToHamlDecorator
 
 def initialize
 end

 def decorate text
=begin
  text.chomp.split.each do |token| 
   if token =~ /Rendered/ 
    style_clause = compose_style
    style puts "---> [#{compose_style}]" 
   end
  end
=end
  compose_span( text, compose_style )
 end
 
 def compose_span text, style
  str = "%span"
  #unless compose_span.nil? || compose_span == ''
  str << "{#{style}}" 
  str << " #{text}"
 end

 def compose_style
  str = ":style=>'"
  str << red_font 
  str << "'"
 end

 def red_font
  'color:red;'
 end

 #  %span{:style=>'color:orange;display:block;'} JOELSHIN

end
