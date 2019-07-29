class LoginController < ApplicationController

    def new
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {userinfo:user,authenticated:"true"}
        else 
            render json: {message:"Username / Password Incorrect.",authenticated:"false"}
        end
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            render json: {message:"User was created.",userinfo:@user , authenticated:"true"}
        else
            render json: {message:"There was a problem",authenticated:"false"}
        end
    end

    private

    def user_params
        params.require(:user).permit(:username,:password)
    end

end
