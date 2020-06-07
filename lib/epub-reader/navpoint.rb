module Epub
  class Navpoint
    attr_reader :label, :content, :nav_points, :page

    def initialize(point, read_file)
      title = point.css('navLabel > text').first.text
      source = point.css('content').attr('src').to_s
      file_path, anchor = source.split("#")
      @page = Page.new(title, file_path, anchor, read_file)

      @label = point.css("navLabel")[0].css("text").text
      @content = point.css("content").first["src"]
      @nav_points = point.css("navPoint").map { |p| self.class.new(p, read_file) }
    end
  end
end
