require 'zip'
require 'nokogiri'
require "epub-reader/version"
require "epub-reader/reader"
require "epub-reader/epubfile"
require "epub-reader/container"
require "epub-reader/package"
require "epub-reader/toc"
require "epub-reader/page"

module Epub
  class FileNotFoundError  < StandardError; end
  class MalformedFileError < StandardError; end
end
