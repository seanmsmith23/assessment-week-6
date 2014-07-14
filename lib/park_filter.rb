class ParkFilter

  def initialize(input)
    @parks = input
  end

  def group_by_id
    Hash[@parks.map { |hash| [hash[:id], hash] } ]
  end

  def group_by_country
    @parks.group_by { |hash| hash[:country] }
  end

end

# [
#   {
#     :id=>546,
#     :name=>"Kalahari Resorts",
#     :city=>"Wisconsin Dells",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   },
#   {
#     :id=>547,
#     :name=>"Little Amerricka",
#     :city=>"Marshall",
#     :state=>"Wisconsin",
#     :country=>"United States"
#   }
# ]