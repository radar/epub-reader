module Epub
  class Page
    attr_reader :title, :path, :anchor
    def initialize(title, path, anchor, read_file)
      @title = title
      @path = path
      @anchor = anchor
      @read_file = read_file
    end

    attr_reader :title, :path

    def content
      @content ||= get_page_content
    end

    private

    def get_page_content
      contents = @read_file.(path, relative: true)
      return contents unless anchor

      html = Nokogiri::HTML.parse(contents)

      html.css("##{anchor}").to_s
    end
  end
end
