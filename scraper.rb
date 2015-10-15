require "pry"
require "./db/setup"
require "./lib/all"


d = Page.save_random
d.follow_link 6


# :to_page_id = page.id
#
#   if Page.all.includes(page.name)
#     :from_page_id = page.id
#   end
