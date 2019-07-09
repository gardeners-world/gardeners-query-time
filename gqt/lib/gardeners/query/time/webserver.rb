require 'sinatra'

require_relative 'voodoo/auth.rb'
sheet = YAML.load_file 'config/sheet.yaml'
service = Gardeners::Query::Time::Voodoo::authed_service
data = service.get_spreadsheet_values sheet['spreadsheet']['id'], 
                                      sheet['spreadsheet']['sheet']

get '/' do
    data.values.to_json
end