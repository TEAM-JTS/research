class PlayerScraper
  attr_accessor :player_data, :name

  def initialize(url)
    @player_data = Nokogiri::HTML(open(url))
  end

  def get_name
    @name = @player_data.css("div.mod-content h1").text
  end

  def get_picture
    @picture = @player_data.css("div.main-headshot img").attr("src").value
  end

  def get_last_game_stats
    @last_game_stats = @player_data.css('tr[class*="team-46"]').map{ |tr|
  tr.css('td').map(&:text)}
  end


  def get_last
    @last_game_stats = @player_data.css('')
  end


  # 'div[id^="para-"]')
  # class="oddrow team-46-19"
  #   'tr[class^="oddrow team-46"]'

# OTHER ATTRIBUTES

# stats from last game
#   - make the game linkable!
# next game date, against who, time, where?
# current season stats (all)


end