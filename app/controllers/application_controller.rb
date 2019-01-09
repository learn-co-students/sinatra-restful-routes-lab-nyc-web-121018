require './config/environment'

 class ApplicationController < Sinatra::Base


    set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#
# In the application_controller.rb, set up a controller action that will render a form to create a new recipe. This controller action should create and save this new recipe to the database

# new form
get '/recipes/new' do
  erb:new
end

# Create a controller action (index action) that displays all the recipes in the database.
get '/recipes' do
  @recipes = Recipe.all
  erb :index
end



  # ORRRRRR Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])


  #
  # Again in the application_controller.rb, create a controller action that uses RESTful routes to display a single recipe.

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  #
  # Create a third controller action that uses RESTful routes and renders a form to edit a single recipe. This controller action should update the entry in the database with the changes, and then redirect to the recipe show page
  post '/recipes' do
    @recipe = Recipe.create(params)
      redirect to "recipes/#{@recipe.id}"
    end


  delete '/recipes/:id/recipe' do #delete action
    @recipe= Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end



end #end class
