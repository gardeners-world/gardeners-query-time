require 'yaml'
require_relative 'lib/gardeners/query/time/voodoo/auth.rb'

conf = YAML.load_file 'config/config.yaml'

g = Gardeners::Query::Time::Voodoo::authed_service
spreadsheet_id = "1-0-AZWN8954NjsUp7b0tpY3aYWW3ZlbRNYOjoCibInA"
range = "Plants"

data = g.get_spreadsheet_values conf['spreadsheet']['id'], conf['spreadsheet']['sheet']
puts data.inspect