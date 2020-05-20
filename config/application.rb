class Application < Sinatra::Base
  configure do
    register Sinatra::Namespace

    set :app_file, File.expand_path('../config.ru', __dir__)
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    json status: :ok
  end
end
