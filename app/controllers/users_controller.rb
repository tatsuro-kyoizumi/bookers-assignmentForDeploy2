class UsersController < ApplicationController
  before_action :authenticate_user!


def  edit

       @user = User.find(params[:id])

    if @user.id == current_user.id

      render :edit
      flash[:notice] = " successfully."


    else

      redirect_to user_path(current_user)

      end




  end

  def create


  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit


      end

  end

  def index
    @book = Book.new
    @users = User.all

  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    if current_user.id !=params[:id].to_i
      redirect_to user_path(current_user.id)
    end
  end
end
