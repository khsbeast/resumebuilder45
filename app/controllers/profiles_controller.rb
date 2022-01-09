class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]
    def show       #To create unique preview link for every profile
        profile2 = Profile.find_by(id: params[:id])
        if(profile2)
            @profile = profile2
        else
            flash[:danger] = "Profile does not exist."
            redirect_to(root_url)
        end
    end
    def update
        updated_profile_params = update_array_attributes_in_params(profile_params)
        puts profile_params
        puts params[:company]
        @profile = Profile.find(params[:id])
        if @profile.update(updated_profile_params)
            flash[:success] = "Profile updated successfully."
            redirect_to edit_url
        else
            flash[:danger] = "Profile update failed."
            redirect_to root_url
        end
    end

    def correct_user
        @profile = Profile.find(params[:id])
        @user = User.find(@profile.user_id)
        redirect_to(root_url) unless @user == current_user
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :avtaar,:job_title, :total_experience, :overview, 
                :career_highlights, :primary_skills, :secondary_skills,
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy],
                :experiences_attributes => [ :id,:company, :position, :description, :start, :end, :_destroy],  #passing experiences_attributes
                :projects_attributes => [ :id,:title, :url, :techstack, :description,:_destroy]  #passing projects_attributes
            )
        end
end
