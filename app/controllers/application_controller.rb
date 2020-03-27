class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get '/new' do 
    erb :new 
  end 
  
  post '/new' do 
    @recipie = Recipie.new(name: params[:name], ingridients: params[:ingridients], cooktime: params[:cook_time])
    @recipie.save
    

end
