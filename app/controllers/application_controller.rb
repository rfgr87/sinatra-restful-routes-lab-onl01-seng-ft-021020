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
  
  get '/new' do 
    erb :new 
  end 
  
  post '/new' do 
    @recipie = Recipie.new(name: params[:name], ingridients: params[:ingridients], cook_time: params[:cook_time])
    if @recipie.save
      @recipie.save
      erb :"/show"
    else 
      redirect :new
    end
  end
  
  get '/recipie/:id'
    @recipie = Recipie.find_by(params[:id])
    erb :'/show'
  end
end
