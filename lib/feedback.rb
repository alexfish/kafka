require 'thread'

Thread.abort_on_exception = true

class Feedback
  GLYPHS = ["|","/","-","\\","|","/","-","\\"]
  def display
    @thread = Thread.new do 
      while true
        GLYPHS.each do |glyph|
          print "\r#{glyph}"
          STDOUT.flush
          sleep 0.15
        end
      end
    end
  end
  
  def hide
    print "\r"
    STDOUT.flush
    @thread.exit
  end
end
