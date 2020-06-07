require 'spec_helper'

describe Epub::Page do

  before(:all) do
    file   = 'spec/data/rails.epub'
    reader = Epub::Reader.open(file)
    @toc = reader.toc
    @page  = @toc.pages.last
  end

  it 'get page title' do
    @page.title.should eq('Ruby on Rails, the framework')
  end

  it 'get page path' do
    @page.path.should eq('text/ch001.xhtml')
  end

  it 'get page content' do
    @page.content.should match('<section.*>')
    @page.content.should match('In this chapter, you learned what Rails is')
  end
end
