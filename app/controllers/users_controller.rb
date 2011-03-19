class UsersController < ApplicationController
  before_filter :setup, :only => [:edit, :update, :show]

  def index
    @users = User.visible.active
  end

  def edit
  end

  def update
    if update_attributes(params[:user])
      flash.now(:notice) = t(:member_update_success)
      redirect_to :back
    else
      flash.now(:error) = t(:member_update_error) + @user.errors.full_messages.to_s
      render :action => :edit
    end
  end

  def show
  end

  protected
  def setup
    raise t(:user_id_param) if params[:id].blank?
    @user = User.find(params[:id])
  end
end
