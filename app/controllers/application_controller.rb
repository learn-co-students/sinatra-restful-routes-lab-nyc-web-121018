class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/recipes"
  end

  #READ: GET + shows all recipes in data base + links to make a new recipe
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #CREATE: GET + shows a form to make a new recipe
  get '/recipes/new' do
    erb :new
  end

  #CREATE: POST + takes the new data, adds the recipe to the database, redirects to show that spesific recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  #READ: GET + takes the id from the uri, shows the recipe at that id + links to edit (UPDATE) recipe + a form to (DESTROY) recipe + go back
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  #UPDATE: GET + takes the id from the uri, shows the recipe at that id and makes a form to edit that recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  #UPDATE: PATCH + takes the id from the uri, takes the data from the form, updates it in the data base, redirects to show that spesific recipe
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

  #DELETE: DELETE + takes the id from the uri, then deletes the data from the recipe at that id, redirects to the main recipe page 
  delete "/recipes/:id" do
    Recipe.destroy(params[:id])
    redirect to "/recipes"
  end

end
