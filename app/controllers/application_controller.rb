class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
get '/recipes' do
  erb :recipes
end


get '/recipes/new' do
  erb :new_recipe
end

get '/recipes/:id' do
  @recipe = Recipe.find(params[:id])
  erb :show
end

get '/recipes/:id/edit' do
  @recipe = Recipe.find(params[:id])
  erb :edit_recipe
end

delete '/recipes/:id' do
  Recipe.destroy(params[:id])
  redirect to "/recipes"
end

patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect to "/recipes/#{ @recipe.id }"
  end



post '/recipes' do
  params.to_s
  @recipe = Recipe.create(params)
  redirect to "/recipes/#{@recipe.id}"
end

end
