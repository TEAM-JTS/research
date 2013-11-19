class TwitterHandleScraper
  attr_reader :site_data
  def initialize(url)
    @site_data = Nokogiri::HTML(open(url))
  end

  def get_name_handle_pair
    @name = @site_data.css("td").text
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