class UsersController < ApplicationController
    def show
        render json: User.find(params[:id]).to_json(user_default)
    end

    private

    def user_default
        {
            :except => [:created_at, :updated_at,:password_digest],
            :include => {
                :campaigns=>{
                            :except =>[:created_at,:updated_at]
                },
                :characters=>{
                    :methods => [:avatar_available,:image_url,:in_campaign],
                    :include => {
                        :char_class=>{
                            :only => [:id,:name,:hit_die]
                        },
                        :proficiencies=>{
                            :except => [:id,:created_at, :updated_at]
                        },
                        :campaigns=>{
                        :except => [:id,:created_at, :updated_at]
                        }
                    }
                }
            }
        }
    end 
end
