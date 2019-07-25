class SkillsController < ApplicationController
    def index 
        skills = Skill.all
        render json: skills.to_json(default)
    end 

    private 
    
    def default 
        {
            :except => [:created_at, :updated_at]
    }
    end
end
