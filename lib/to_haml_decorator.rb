class ToHamlDecorator
 
 def initialize
 end

 def decorate text
  puts "---> in decorate text: [#{text.chomp}]"
  text.chomp.split.each do |token| 
   puts "---> [#{compose_style}]" if token =~ /Rendered/ 
  end
  text
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
