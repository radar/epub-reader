module Epub
  class Navpoint
    attr_reader :label, :content, :points

    def initialize(point)
      @label = point.css("navLabel")[0].css("text").text
      @content = point.css("content").first["src"]
      @points = point.css("navPoint").map { |p| self.class.new(p) }
    end
  end
end
