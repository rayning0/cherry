require 'stringio'
require 'timeout'

class WelcomeController < ApplicationController
  def index
    @coders = Coder.all
    @testers = Tester.all
  end

  def rubyeval
    expression = params[:line]

    sand = Sandbox.safe
    sand.eval("require 'stringio'") #require it BEFORE activating Sandbox
    sand.activate!    # Screens code for malicious commands through Sandbox
    
    string_io = ""
    return_val = ""

    begin  
      Timeout::timeout(6) {  # protects against some code running too long
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
    }
    rescue Exception => e  
      if e.message.include?("execution expired")
        error_msg = "Your code took too long to run. It probably has an infinite loop."
      else
        error_msg = e.message  
      end
    end 

    #Rails.logger.info("PARAMS: #{params.inspect}. ANSWER: #{answer.inspect}")

    render :json => {answer: [string_io, return_val, error_msg]}
  end

  def test
  end
end
