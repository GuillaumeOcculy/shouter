class ShoutsController < ApplicationController


  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.build(shout_params)
    if shout.save
    else
      flash[:alert] = 'Could not shout.'
    end
    redirect_to dashboard_path
  end

  private
  def shout_params
    params.require(:shout).permit(:body, :user_id)
  end
end
