require_relative 'config/environment'

use Rack::Ougai::LogRequests, Application.logger

map '/ads' do
  run AdRoutes
end
