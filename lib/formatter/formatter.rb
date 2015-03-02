require 'logger'

class Formatter


  def initialize(next_formatter = nil)
    next_in_chain next_formatter
  end

end