require_relative './config/environment.rb'

agent = Mechanize.new
page = agent.get('http://search.espn.go.com/jeremy-lin')

# page.links_with(:text => 'Jeremy Lin').each do |link|
#   puts link.href
# end

puts page.links_with(:text => 'Jeremy Lin').first.href

# jlin_url = "http://espn.go.com/nba/player/_/id/4299/jeremy-lin"

# scraper = PlayerScraper.new(jlin_url)
# jlin_name = scraper.get_name
