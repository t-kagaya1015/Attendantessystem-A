class ApprovalsController < ApplicationController
  protect_from_forgery
  
  def index
  end
  
  def create
   @user = User.find(params[:user_id])
   @approval = @user.approvals.create(approvals_params)
   @superior_user = User.where(superior: true)
     if @approval.save
       flash[:success] = "申請しました。"
       redirect_to user_path(@user)
     end 
  end 
end
