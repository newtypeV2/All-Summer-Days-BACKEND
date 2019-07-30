class UsersController < ApplicationController
    def show
        render json: User.find(params[:id]).to_json(user_default)
    end

    private

    def user_default
        {
            :except => [:created_at, :updated_at,:password_digest],
            :include => {
                :characters=>{
                    :methods => [:avatar_available,:image_url],
                    :include => {
                        :char_class=>{
                            :only => [:id,:name,:hit_die]
                        },
                        :proficiencies=>{
                        :except => [:id,:created_at, :updated_at]
                        }
                    }
                }
            }
        }
    end 
end
