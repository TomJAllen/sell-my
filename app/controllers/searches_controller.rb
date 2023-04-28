require "open-uri"
require "nokogiri"

class SearchesController < ApplicationController

  def index; end

  def search
    # search = params[:search] # initial search from index page
    @search = params[:search]
    @depop_search = depop_search
    @swop_search = swop_search
  end

  def depop_search
    @depop_results = []
    html_content = URI.open("https://www.depop.com/search/?q=#{@search}").read
    doc = Nokogiri::HTML.parse(html_content)

    doc.search('[data-testid="product__items"] [data-testid="product__item"]').each_with_index do |element, index|
      link = element.get_attribute('href')
      @depop_results << "#{index + 1}. #{link}"
    end
  end

  def swop_search
    @swop_results = []
    html_content = URI.open("https://swop.net.au/search?q=#{@search}").read
    doc = Nokogiri::HTML.parse(html_content)

    doc.search('.full-unstyled-link').each_with_index do |element, index|
      link = element.get_attribute('href')
      @depop_results << "#{index + 1}. #{link}"
    end
  end


end
