class CharclassesController < ApplicationController
    def index
       charclasses = CharClass.all
        render json: charclasses
    end 
end
