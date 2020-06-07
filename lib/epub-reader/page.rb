module Epub
  class Page
    attr_reader :title, :path, :anchor, :file
    def initialize(title, path, file)
      @title = title
      @path, @anchor = path.split("#")
      @file  = file
    end

    attr_reader :title, :path

    def content
      @content ||= get_page_content
    end

    private

    def get_page_content
      file_contents = @file.get_input_stream(@path).read
      return file_contents unless anchor

      html = Nokogiri::HTML.parse(file_contents)

      html.css("##{anchor}").to_s
    end
  end
end
