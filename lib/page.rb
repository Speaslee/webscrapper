require 'mechanize'

class Page < ActiveRecord::Base
  validates_presence_of :name, :url
  validates_uniqueness_of :url
  has_many :links
  attr_reader :list_o_links


  def self.save_random new_url = nil
    #search for random page

    agent = Mechanize.new
    if new_url
      page = agent.get(new_url)
    else
      page = agent.get("http://wikipedia.org/wiki/Main_Page")
      link = page.link_with(text: 'Random article')
      page = link.click
      @list_o_links = (page.search("p").search("a")).to_a

    end

    i = self.new(
    name: page.title,
    prelude: page.search("p").first,
    url: page.uri
    )
    i.save

  end

  def follow_link nums
    list_o_url= @list_o_links.map {|l| "http://www.wikipedia.org"+l.attributes["href"].value}
    list_o_url.sample(nums).each do |u|
      save_page url
    end
  end

  

end
