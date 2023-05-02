require 'sinatra/base'
require 'sinatra/reloader'


class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/hello" do
    name = params[:name]

    return "Hello #{name}!"
  end

  get "/names" do
    return "Julia, Mary, Karim"
  end

  post "/sort-names" do
    names = params[:names]

    names_array = names.split(",")
    names_array.sort!
    
    return names_array.join(",")
  end

  # GET /
  # Root path (homepage, index page)

  # get '/' do
  #   return 'Hello!'
  # end

  # get '/posts' do
  #   name = params[:name] # access passed parameters
  #   cohort_name = params[:cohort_name]

  #   return "Hello #{name}, you are in the cohort #{cohort_name}"
  # end

  # get "/hello" do
  #   name = params[:name]

  #   return "Hello #{name}"
  # end

  # post '/posts' do
  #   title = params[:title]
    
  #   return "Post was created with title: #{title}"
  # end

  # post "/submit" do
  #   name = params[:name]
  #   message = params[:message]

  #   return "Thanks #{name}, you sent this message: '#{message}'"
  # end
end