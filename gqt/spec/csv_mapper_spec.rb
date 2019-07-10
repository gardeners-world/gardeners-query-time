module Gardeners
    module Query
        module Time
            describe CSVMapper do
                it 'generates JSON' do 
                    csv = [
                        ["Plant", "Variety", "Plant type", "Common name", "Wikipedia URL", "Imgur URL", "Number", "PH", "Water", "Fertiliser "], 
                        ["Alocasia", "Zebrina", "", "Elephant ears ", "https://en.wikipedia.org/wiki/Alocasia"], 
                        ["Aloe"],
                        ["Begonia", "Maculata", "", "Polka dot begonia, trout begonia "]
                    ]
                    expect(described_class.convert csv).to eq [
                        {
                            "plant"=>"alocasia", 
                            "variety"=>"zebrina", 
                            "common name(s)"=>["elephant ears"], 
                            "wikipedia url"=>"https://en.wikipedia.org/wiki/alocasia"
                        },
                        {
                            "plant"=>"aloe"
                        },
                        {
                            "plant"=>"begonia", 
                            "variety"=>"maculata", 
                            "common name(s)"=>[
                                "polka dot begonia", 
                                "trout begonia"
                            ]
                        }
                    ]
                end
            end
        end
    end
end