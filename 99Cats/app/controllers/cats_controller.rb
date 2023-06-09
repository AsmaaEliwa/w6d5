class CatsController < ApplicationController
    def index
        @cats = Cat.all 
        render  :index
    end

    def show
        @cat = Cat.find(params[:id]) 
        render :show
    end

    def new 
        render :new
    end 

    def create 
        @cat = Cat.new(cat_params)

        if @cat.save 
            redirect_to :show
        else 
            render json: @cat.errors.full_messages, status: 422
        end 
        
    end


    private 
    def cat_params
        params.require(:cat).permit(:name,:age,:color,:birth_date,:sex)
    end
end
