class AdRoutes < Application
  get '/' do
    json ads: []
  end
end
