class CharClassesController < ApplicationController
    def index
        render json: CharClass.all.to_json(
            :except => [:created_at, :updated_at,:proficiency_skill,:proficiency_tools,:proficiency_instruments],
            # :include => {
            #     :proficiencies => {
            #         :except => [:id,:created_at, :updated_at]
            #     },
            #     :skills => {
            #          :except => [:id,:created_at, :updated_at]
            #     }
            # },
            :methods => [:choose_proficiencies,:passive_proficiencies,:saving_throws]
        )
    end 
end
