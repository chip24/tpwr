require 'open-uri'
require 'nokogiri'

class LeagueTable

  def initialize(url = nil)
    @url ||= "https://www.bbc.com/sport/football/premier-league/table"
    parse(html)
  end

  def html
    @html ||= open(@url)
  end

  def parse(html)
    @doc ||= Nokogiri::HTML(html)
  end

  def teams
    @teams ||= rows.map { |row| Team.from_html(row) }
  end

  def each(*args, &block)
    teams.each(&block)
  end

  include Enumerable

  private
  def rows
    @doc.at_css('table.table-stats').css('tbody tr')
  end
end

class Team < Struct.new(:position, :name, :points)
  def self.from_html(row)
    new(
      row.at_css('span.position-number').text.to_i,
      row.at_css('td.team-name').text,
      row.at_css('td.points').text.to_i
      )
  end
end

# on 2-10 fubd a more modern text scraping tutorial online
table = LeagueTable.new
table.each do |team|
  printf "%2s. %-14s %3 pts\n", team.position, team.name, team.points
end