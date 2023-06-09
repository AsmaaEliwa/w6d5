class CatsController < ApplicationController
def index
   @cats=Cat.all 
   render  :index
end
def show
    @cat=Cat.find(params[:id]) 
    render :show
 end
    def cat_params
        params.require(:cat).permit(:name,:age,:color,:birth_date,:sex)
    end
end
