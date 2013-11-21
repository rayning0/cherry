# coding: utf-8

class Repl
  class History
    def initialize
      @history = []
    end

    def << command
      case command
      when /\A!(\d+)/, "history"
        # do nothing
      else
        @history << command
      end
    end

    def indexed_list
     @history.each_with_index.map { |c, i| "[#{i + 1}] #{c}" }
    end

    def [] index
      @history[index - 1]
    end
  end

  def initialize
    @history = History.new
  end

  def execute command
    result = case command
    when /\A!(\d+)/
      eval(@history[$1.to_i]).to_s
    when "history"
      @history.indexed_list.join "\n"
    else
      eval(command).to_s
    end
    @history << command
    result
  end
end


  repl = Repl.new
  while command = gets.chomp
    puts repl.execute command
  end
