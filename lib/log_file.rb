require 'file/tail'

class LogFile < File
 include File::Tail
end
