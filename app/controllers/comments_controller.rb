class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    if Comment.create(create_params)
      flash.now[:notice] = ""
    else
      flash.now[:alert] = "Pick$B$G$-$^$;$s$G$7$?!#(B"
    end
  end

  def destroy
    if Comment.find(params[:id]).destroy
      flash.now[:notice] = "Pick$B$r:o=|$7$^$7$?!#(B"
    else
      flash.now[:alert] = "Pick$B$r:o=|$G$-$^$;$s$G$7$?!#(B"
    end
  end

  private
    def create_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, letter_id: params[:letter_id])
    end
end

