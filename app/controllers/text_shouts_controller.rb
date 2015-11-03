class TextShoutsController < ApplicationController

  def create
    content = build_content
    shout = current_user.shouts.build(content: content)
    if shout.save
    else
      flash[:alert] = 'Could not shout.'
    end
    redirect_to dashboard_path
  end


  private

  def build_content
    TextShout.new(text_shout_paramameters)
  end

  def text_shout_paramameters
    params.require(:text_shout).permit(:body)
  end
end
