require './lib/dorsey'

class MainApplication < Dorsey::App

  not_found do
    erb(:not_found)
  end

  get '/' do
    erb(:home)
  end

  get '/home' do
    erb(:home)
  end

  get '/about' do
    erb(:about)
  end

end
