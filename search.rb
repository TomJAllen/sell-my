require "open-uri"
require "nokogiri"

class Search
  def initialize(search)
    @search = search
    @html_content = URI.open("https://www.depop.com/search/?q=#{@search}").read
    @doc = Nokogiri::HTML.parse(html_content)
  end

end

html_content = URI.open('https://www.depop.com/category/mens/tops').read
doc = Nokogiri::HTML.parse(html_content)
# puts doc
# title = doc.search('[data-testid="product__items"]')
# puts title

doc.search('[data-testid="product__items"] [data-testid="product__item"]').each_with_index do |element, index|
  link = element.get_attribute('href')
  puts "#{index + 1}. #{link}"
  # puts "#{index + 1}. #{element.getAttribute('href')}"
end
