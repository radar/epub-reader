require 'spec_helper'

describe Epub::Page do

  before(:all) do
    file   = 'spec/data/rails.epub'
    reader = Epub::Reader.open(file)
    @toc   = Epub::Toc.new(reader.package.toc, reader)
    @page  = @toc.pages.last
  end

  it 'get page title' do
    @page.title.should eq('Summary')
  end

  it 'get page path' do
    @page.path.should eq('EPUB/text/ch001.xhtml')
  end

  it 'get page content' do
    @page.content.should match('<section.*>')
    @page.content.should match('In this chapter, you learned what Rails is')
  end
end
