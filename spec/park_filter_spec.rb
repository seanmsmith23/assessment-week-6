require "park_filter"

describe ParkFilter do

  before do
    @parks1 = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      }
    ]

    @parks2 = [
      {
        :id=>546,
        :name=>"Kalahari Resorts",
        :city=>"Wisconsin Dells",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>547,
        :name=>"Little Amerricka",
        :city=>"Marshall",
        :state=>"Wisconsin",
        :country=>"United States"
      },
      {
        :id=>2,
        :name=>"Calaway Park",
        :city=>"Calgary",
        :state=>"Alberta",
        :country=>"Canada"
      }
    ]
  end

  describe "#group_by_id" do
    it "returns the amusement parks grouped by their id" do
      id_groups = {
          546 =>
            {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
          },
        547 =>
          {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
          }
      }

      expect(ParkFilter.new(@parks1).group_by_id).to eq(id_groups)
    end
  end

  describe "#group_by_country" do
    it "groups the amusement parks by their country" do
      by_country = {
        "Canada" => [
          {
            :id=>2,
            :name=>"Calaway Park",
            :city=>"Calgary",
            :state=>"Alberta",
            :country=>"Canada"
          }
        ],
        "United States" => [
          {
            :id=>546,
            :name=>"Kalahari Resorts",
            :city=>"Wisconsin Dells",
            :state=>"Wisconsin",
            :country=>"United States"
          },
          {
            :id=>547,
            :name=>"Little Amerricka",
            :city=>"Marshall",
            :state=>"Wisconsin",
            :country=>"United States"
          }
        ]
      }

      expect(ParkFilter.new(@parks2).group_by_country).to eq(by_country)
    end
  end
end
