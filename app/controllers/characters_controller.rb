class CharactersController < ApplicationController

    def index 
       characters = Character.all
       render json: characters.to_json(
        :except => [:created_at, :updated_at],
        :include => {
            :char_class=>{
                :except => [:id,:created_at, :updated_at]
            },
            :proficiencies=>{
                :except => [:id,:created_at, :updated_at]
            },
            :skills => {
                :except => [:id,:created_at, :updated_at]
            }
        }
    )
    end 

    def show
        character = Character.find_by(id: params[:id])
        render json: character.to_json(default)
    end 

    def update
        character = Character.find_by(id: params[:id])
        character.update(character_params)
        render json: character.to_json(default)
    end 

    def create 
        character = Character.create(character_params) 
        render json: character 
    end 

    def destroy 
        character = Character.find_by(id: params[:id])
        character.destroy 
        render json: character
    end

    private 

    def character_params
        params.require(:character).permit(:firstname, :lastname, :class_id, :level, :strength, :dexterity, :constitution, :intelligence, :charisma, :age, :height, :weight, :eyes, :skin, :hair, :background, :alignment)
    end 

    def default 
        {
            :except => [:created_at, :updated_at]
    }
        
   
    end 
end