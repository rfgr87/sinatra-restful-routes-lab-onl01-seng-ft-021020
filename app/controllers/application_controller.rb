class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect '/recipes'
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get 'recipes/new' do 
    erb :new 
  end 
  
  
  post '/recipes' do
    @recipe = Recipie.new(name: params[:name], ingridients: params[:ingridients], cook_time: params[:cook_time])
    if @recipe.save
      erb :"/recipes/#{@recipe.id}"
    else 
      redirect :new
    end
  end
  
  get '/recipie/:id'
    @recipe = Recipie.find_by(params[:id])
    erb :'/show'
  end
end
