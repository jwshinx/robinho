require 'file/tail'

puts '---> Start'

class MyFile < File
  include File::Tail
end
log = MyFile.new("development.log")
log.interval = 20
log.backward(20)
log.tail(20) do |line| 
 puts line unless line =~ /DEPRECATION/
end

puts '---> End'
