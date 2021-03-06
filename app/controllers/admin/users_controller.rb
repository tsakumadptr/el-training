class Admin::UsersController < ApplicationController
before_action :auth_admin


  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password:params[:password])
    if @user.save
      flash[:notice] = "ユーザーを登録しました"
      redirect_to("/admin/users")
    else
      render("/admin/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.admin = params[:admin]
    if @user.save
      flash[:notice] = "情報を更新しました"
      redirect_to("/admin/users")
    else
      render("/admin/users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to("/admin/users")
  end


end
