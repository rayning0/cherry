class RandomStuffController < ApplicationController
  def text
    render text: "simple text" # don't need a browser or ERB page! test passes
  end

  def nothing
    render nothing: true
    # or don't put anything here and make empty file /random_stuff/nothing.html.erb
  end

  def classified
    if params[:token]
      render text: "good job", status: 200
    else
      render nothing: true, status: 401
    end
  end

  def zig
    redirect_to '/zag' 
    # or redirect_to action: 'zag'
  end

  def zag
  end
end
