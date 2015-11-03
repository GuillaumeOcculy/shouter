class PhotoShoutsController < ApplicationController

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
    PhotoShout.new(photo_shout_paramameters)
  end

  def photo_shout_paramameters
    params.require(:photo_shout).permit(:image)
  end
end
