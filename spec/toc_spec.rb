# -*- coding: utf-8 -*-
require 'spec_helper'

describe Epub::Toc do

  before(:all) do
    file    = 'spec/data/rails.epub'
    @reader = Epub::Reader.open(file)
    @toc = @reader.toc
    @html   = Nokogiri::XML(@toc.content)
  end

  it 'has nav_points' do
    nav_points = @toc.nav_points
    expect(nav_points.first.label).to eq("Ruby on Rails, the framework")
    expect(nav_points.first.content).to eq("text/title_page.xhtml")

    second_point = nav_points[1]
    expect(second_point.label).to eq("Ruby on Rails, the framework")
    expect(second_point.content).to eq("text/ch001.xhtml#ruby-on-rails-the-framework")
    expect(second_point.nav_points.count).to eq(5)
    expect(second_point.nav_points.first.label).to eq("Ruby on Rails, the framework")
    expect(second_point.nav_points.first.content).to eq("text/ch001.xhtml#_ruby_on_rails_the_framework")
    expect(second_point.nav_points.last.label).to eq("Summary")
  end

  it 'convert <ncx>      to <html>' do
    @html.css('html').size.should eq(1)
  end

  it 'convert <docTitle> to <title>' do
    @html.css('head > title').text.should eq("Ruby on Rails, the framework")
  end

  it 'convert <navMap>   to <nav>' do
    @html.css('nav').size.should eq(1)
  end

  it 'convert <navPoint> to <a>' do
    @html.css('li > a').size.should eq(2)
  end
end
