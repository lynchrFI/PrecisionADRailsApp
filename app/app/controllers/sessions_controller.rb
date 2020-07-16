class SessionsController < ApplicationController

    def home
    end

    def new
    end

    def create
        if request.env['omniauth.auth']
            user = User.create_with_omniauth(request.env['omniauth.auth'])
            session[:user_id] = user.id 
            redirect_to user_path(user.id)
        elsif
            user = User.find_by(email: params[:user][:email])
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                flash[:message] = "Invalid Email and/or Password, please try again."
                redirect_to "/login"
            end
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end
end