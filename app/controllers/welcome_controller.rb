require 'sandbox'
require 'pry'
require 'stringio'

class WelcomeController < ApplicationController
  def index

  end

  def rubyeval
    sand = Sandbox.safe
    sand.activate!
    expression = params[:line]
    expression = expression.gsub('puts', '')
    binding.pry
    answer = sand.eval <<-RUBY 
      #{expression}
    RUBY
    #binding.pry
    #answer = eval("begin $stdout = StringIO.new; 
      #{expression}; 
      #$stdout.string;
      #ensure $stdout = STDOUT end")
    #answer = eval(expression)
    Rails.logger.info("PARAMS: #{params.inspect}. ANSWER: #{answer.inspect}")

    render :json => {answer: answer}
  end
end
