class UsersController < ApplicationController
    

    def index
        @users = User.all 
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @trainer
        else
            render :new
        end
    end

    def show
        if current_user.id == @user.id
            render :show
        else
            redirect_to user_path(current_user)
        end
    end

    def edit
        if current_user.id == @user.id
            render :edit
        else
            redirect_to user_path(current_user)
        end
    end

    def update
        @user.update(user_params)

        if @user.save
            redirect_to @user
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:trainer).permit(:name, :email, :password)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end