require 'spec_helper'

describe Epub::Package do

  before(:all) do
    @file = 'spec/data/valid.epub'
    @reader = Epub::Reader.open(@file)
  end

  it 'get raw content' do
    @reader.package.raw.should_not be_empty
  end

  it 'get file path' do
    @reader.package.path.should_not be_empty
  end

  it 'get media type' do
    @reader.package.mediatype.should eq("application/oebps-package+xml")
  end

  it 'get the epub version' do
    @reader.package.version.should eq(2)
  end

  it 'get the epub unique identifier' do
    @reader.package.identifier.should eq("urn:uuid:bdb0c6b5-5620-440f-9e14-5e1500197941")
  end

  it 'get the content language' do
    @reader.package.language.should eq("en")
  end

  it 'get the content title' do
    @reader.package.title.should eq("Flowers of Evil")
  end

  it 'get the content creator' do
    @reader.package.creator.should eq("Charles Baudelaire")
  end

  it 'get the content contributor' do
    @reader.package.contributor.should eq("ManyBooks.net")
  end

  it 'get the publication date' do
    @reader.package.date.should be_empty
  end

  it 'get the publication source' do
    @reader.package.source.should be_empty
  end

  it 'get the content type' do
    @reader.package.source.should be_empty
  end
end
