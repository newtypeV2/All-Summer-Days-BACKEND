class CharClassesController < ApplicationController
    def index
        render json: CharClass.all.to_json(
            :only => [:id,:name],
            :include => {
                :proficiencies => {
                    :except => [:id,:created_at, :updated_at]
                },
                :skills => {
                    :except => [:id,:created_at, :updated_at]
                }
            }
        )
    end 
end
