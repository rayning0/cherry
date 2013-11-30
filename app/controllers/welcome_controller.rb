require 'sandbox'
require 'stringio'
require 'pry'

class WelcomeController < ApplicationController
  def index

  end

  def rubyeval
    sand = Sandbox.safe
    sand.eval("require 'stringio'") #require it BEFORE activating Sandbox
    sand.activate!
    expression = params[:line]
    # temporary solution to avoid running "system" commands
    expression = expression.gsub("system", '')  
    begin  
      string_io = sand.eval("
        buffer = StringIO.new
        $stdout = buffer
        
        def puts(args)
          $stdout.puts(args)
        end
        
        #{expression}

        $stdout.string
        ")

      return_val = sand.eval(expression)
    rescue Exception => e  
      error_msg = e.message  
    end 

    #Rails.logger.info("PARAMS: #{params.inspect}. ANSWER: #{answer.inspect}")

    render :json => {answer: [string_io, return_val, error_msg]}
  end
end
