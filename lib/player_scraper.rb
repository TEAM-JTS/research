class PlayerScraper
  attr_reader :player_data, :name, :picture, :most_recent_0, :most_recent_1,:most_recent_2,:most_recent_3,:most_recent_4, :season_averages_hash, :career_averages_hash, :game_day, :game_time, :game_matchup

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
    @last_game_stats = @player_data.css('tr[class*="team-46"]').map{ |tr|tr.css('td').map(&:text)}
    @most_recent_0 = {date: @last_game_stats[0][0], vs: @last_game_stats[0][1], score: @last_game_stats[0][2], minutes: @last_game_stats[0][3], fgam: @last_game_stats[0][4], threepointam: @last_game_stats[0][6], ftam: @last_game_stats[0][8], reb: @last_game_stats[0][10], ast: @last_game_stats[0][11], blk: @last_game_stats[0][12], stl: @last_game_stats[0][13], turnovers: @last_game_stats[0][15], pts: @last_game_stats[0][16]}
    @most_recent_1 = {date: @last_game_stats[1][0], vs: @last_game_stats[1][1], score: @last_game_stats[1][2], minutes: @last_game_stats[1][3], fgam: @last_game_stats[1][4], threepointam: @last_game_stats[1][6], ftam: @last_game_stats[1][8], reb: @last_game_stats[1][10], ast: @last_game_stats[1][11], blk: @last_game_stats[1][12], stl: @last_game_stats[1][13], turnovers: @last_game_stats[1][15], pts: @last_game_stats[1][16]}
    @most_recent_2 = {date: @last_game_stats[2][0], vs: @last_game_stats[2][1], score: @last_game_stats[2][2], minutes: @last_game_stats[2][3], fgam: @last_game_stats[2][4], threepointam: @last_game_stats[2][6], ftam: @last_game_stats[2][8], reb: @last_game_stats[2][10], ast: @last_game_stats[2][11], blk: @last_game_stats[2][12], stl: @last_game_stats[2][13], turnovers: @last_game_stats[2][15], pts: @last_game_stats[2][16]}
    @most_recent_3 = {date: @last_game_stats[3][0], vs: @last_game_stats[3][1], score: @last_game_stats[3][2], minutes: @last_game_stats[3][3], fgam: @last_game_stats[3][4], threepointam: @last_game_stats[3][6], ftam: @last_game_stats[3][8], reb: @last_game_stats[3][10], ast: @last_game_stats[3][11], blk: @last_game_stats[3][12], stl: @last_game_stats[3][13], turnovers: @last_game_stats[3][15], pts: @last_game_stats[3][16]}
    @most_recent_4 = {date: @last_game_stats[4][0], vs: @last_game_stats[4][1], score: @last_game_stats[4][2], minutes: @last_game_stats[4][3], fgam: @last_game_stats[4][4], threepointam: @last_game_stats[4][6], ftam: @last_game_stats[4][8], reb: @last_game_stats[4][10], ast: @last_game_stats[4][11], blk: @last_game_stats[4][12], stl: @last_game_stats[4][13], turnovers: @last_game_stats[4][15], pts: @last_game_stats[4][16]}
  end

  def get_season_averages
    @season_averages_array = @player_data.css('.oddrow').map{|row| row.css('td').map(&:text)}[2]
    @season_averages_hash = {gp: @season_averages_array[1], mpg: @season_averages_array[2], fgp: @season_averages_array[4], threepointp: @season_averages_array[6], ftp: @season_averages_array[8], rb: @season_averages_array[9], ast: @season_averages_array[10], blk: @season_averages_array[11], stl: @season_averages_array[12], turnovers: @season_averages_array[14], pts: @season_averages_array[15]}
  end

  def get_career_averages
    @career_averages_array = @player_data.css('.evenrow').map{|row| row.css('td').map(&:text)}[2]
    @career_averages_hash = {gp: @career_averages_array[1], mpg: @career_averages_array[2], fgp: @career_averages_array[4], threepointp: @career_averages_array[6], ftp: @career_averages_array[8], rb: @career_averages_array[9], ast: @career_averages_array[10], blk: @career_averages_array[11], stl: @career_averages_array[12], turnovers: @career_averages_array[14], pts: @career_averages_array[15]}
  end

  def get_next_game_info
    @game_time_day = @player_data.css('.time').text.scan(/(\w+)(\d+:\d+\D+)/).flatten
    @game_time = @game_time_day[0]
    @game_day = @game_time_day[1]
    @game_matchup = @player_data.css('.record').text.scan(/([\w\s]+)\(/).join(" vs ")
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