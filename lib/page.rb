require 'mechanize'

class Page < ActiveRecord::Base
validates_presence_of :name, :url
validates_uniqueness_of :url
has_many :links

def self.save_random
#search for random page
agent = Mechanize.new
page = agent.get("http://wikipedia.org/wiki/Main_Page")
link = page.link_with(text: 'Random article')
page = link.click
# 
# body_text= page.search("body p")
# results = []
# paragraphs = body_text.each do |para|
#  something = para.search "p"
#   results.push(something)
#   end

i = self.new(
name: page.title,
prelude: page.search("p").first,
url: page.uri
)
i.save

end

def follow_link (nums)

end




end
