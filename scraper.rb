require "pry"
require "./db/setup"
require "./lib/all"


d = Page.save_random 

d.follow_link 6
