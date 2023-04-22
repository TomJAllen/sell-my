require "open-uri"
require "nokogiri"

class SearchesController < ApplicationController

  def index; end

  def search
    # search = params[:search] # initial search from index page
    search = params[:search]
    @results = []
    html_content = URI.open("https://www.depop.com/search/?q=#{search}").read
    doc = Nokogiri::HTML.parse(html_content)

    doc.search('[data-testid="product__items"] [data-testid="product__item"]').each_with_index do |element, index|
      link = element.get_attribute('href')
      @results << "#{index + 1}. #{link}"
    end
  end


end
