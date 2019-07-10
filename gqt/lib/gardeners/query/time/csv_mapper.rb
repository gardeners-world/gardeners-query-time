module Gardeners
    module Query
        module Time
            class CSVMapper
                def self.convert csv
                    converted = [] 
                    headers = csv.shift 
                    for line in csv do
                        entry = {}

                        line.each_with_index do |value, index|
                            if value != ''
                                key = headers[index].downcase
                                if key == 'common name'
                                    key = 'common name(s)'
                                    value = value.split(',').map! { |v| v.strip.downcase }
                                else
                                    value.downcase!
                                end
                                entry[key] = value
                            end
                        end
                        converted.push entry
                    end
                    puts converted
                    converted
                end
            end
        end
    end
end