class CampaignsController < ApplicationController
    def show
        render json: Campaign.find(params[:id]).to_json(campaign_default)
    end

    def index
        render json: Campaign.all.to_json(
            :except => [:created_at, :updated_at]
        )
    end

    private

    def campaign_default
        {
            :except => [:created_at, :updated_at,:password_digest],
            :include => {
                :users=>{
                    :except => [:id,:created_at, :updated_at]
                },
                :characters=>{
                    :methods => [:avatar_available,:image_url,:in_campaign],
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
