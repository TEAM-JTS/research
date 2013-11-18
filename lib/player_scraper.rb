class PlayerScraper
  attr_accessor :player_data, :name

  def initialize(url)
    @player_data = Nokogiri::HTML(open(url))
  end

  def get_name
    name = @player_data.css("div.mod-content h1").text
  end

# OTHER ATTRIBUTES
# picture
# stats from last game
#   - make the game linkable!
# next game date, against who, time, where?
# current season stats (all)


end