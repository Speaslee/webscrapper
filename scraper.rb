require "pry"
require "./db/setup"
require "./lib/all"

page = Page.save_random
 page.follow_link(6)
