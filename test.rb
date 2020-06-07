# `rake install`
require 'rubygems'
require 'epub-reader'

f1 = Epub::Reader.open(ARGV[0])

require 'pry'
binding.pry
puts f1.cover
