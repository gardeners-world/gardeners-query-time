require 'sinatra'
require 'rack/conneg'

require_relative 'voodoo/auth'
require_relative 'csv_mapper'

sheet = YAML.load_file 'config/sheet.yaml'
service = Gardeners::Query::Time::Voodoo::authed_service
data = service.get_spreadsheet_values sheet['spreadsheet']['id'], 
                                      sheet['spreadsheet']['sheet']

use(Rack::Conneg) { |conneg|
  conneg.set :accept_all_extensions, false
  conneg.set :fallback, :html
  conneg.provide([:html, :json])
}

get '/' do
    plants = Gardeners::Query::Time::CSVMapper.convert data.values
    {plants: plants}.to_json
end