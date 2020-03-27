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
    @recipie = Recipie.new(name: params[:name], ingridients: params[:ingridients], cook_time: params[:cook_time])
    if @recipie.save
      @recipie.save
      erb :"/recipes/#{recipe.id}"
    else 
      redirect :new
    end
  end
  
  get '/recipie/:id'
    @recipie = Recipie.find_by(params[:id])
    erb :'/show'
  end
end
