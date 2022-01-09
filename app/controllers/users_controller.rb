class UsersController < ApplicationController
    def new
    end

    def create
        user = User.new({name: params[:user][:name],email:params[:user][:email].downcase,password:params[:user][:password]})
        user.profile = Profile.new
        val = User.find_by(email: params[:user][:email])
        if !val
           if(params[:user][:password].length >= 8)
                if(params[:user][:password] == params[:user][:confirmpassword])
                    user.save
                    log_in(user)
                    if(logged_in?)
                    redirect_to(root_path)
                    else
                    flash.now[:danger] = 'Cannot signup at this moment'
                    render('new')
                    end
                else
                    flash.now[:danger] = 'Password not matched please try again'
                    render('new')
                end
           else
            flash.now[:danger] = 'Password too short'
            render('new')
            end
        else
            flash.now[:danger] = 'User with that email already present'
            render('new')
            end
            
    end
end
