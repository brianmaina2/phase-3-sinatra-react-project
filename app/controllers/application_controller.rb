class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/recipes' do
  recipe = Recipe.all
  recipe.to_json
  end

  get '/recipes/:id' do 
    recipe = Recipe.find_by(id: params[:id])
    recipe.to_json
  end
  
  post '/recipes' do
  recipe = Recipe.create(
  name: params[:name],
  ingredients: params[:ingredients],
  cooking_time: params[:cooking_time],
  instructions: params[:instructions]
  )
  recipe.to_json
  end
  

  delete '/recipes/:id' do
  recipe = Recipe.find_by(id: params[:id])
  if recipe
  recipe.destroy
  status 204
  else
  status 404
  end
  end 
  # This route returns a list of all the users.
get '/users' do
  recipe = User.all
  recipe.to_json
  end


# This route creates a new user.
post '/users' do
user = User.create(
email: params[:email],
password: params[:password]
)
user.to_json
end

# This route deletes a user with the specified ID.
delete '/users/:id' do
user = User.find_by(id: params[:id])
if user
user.destroy
status 204
else
status 404
end
end



  end

  
