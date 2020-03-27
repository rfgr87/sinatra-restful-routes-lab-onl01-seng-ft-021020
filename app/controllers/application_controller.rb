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
    @recipe = Recipie.new(name: params[:name], ingridients: params[:ingredients], cook_time: params[:cook_time])
    if @recipe.save
      erb :"/recipes/#{@recipe.id}"
    else 
      redirect :new
    end
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name],
    @recipe.ingredients = params[:ingredients],
    @recipe.cook_time = params[:cook_time]
    redirect "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end
end
