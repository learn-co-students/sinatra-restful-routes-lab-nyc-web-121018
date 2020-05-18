class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do

  erb :new
  end

  get '/recipes' do
    @recipe = Racipe.all
    erb :index
  end

  get'/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :show


  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(params[:id])


    erb :edit
  end

  post '/recipes'
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  # code actions here!
