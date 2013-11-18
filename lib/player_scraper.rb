class PlayerScraper
  attr_accessor :player_data

  def initialize(url)
    @player_data = Nokogiri::HTML(open(url))
  end
end