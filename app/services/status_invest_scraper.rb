class StatusInvestScraper
  private_class_method :new
  SOURCE_URL_FOR_QUOTES = 'https://statusinvest.com.br/acoes/'

  def self.call(ticker)
    url = SOURCE_URL_FOR_QUOTES + ticker
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)

    raise 'Ticker not found' if parsed_page.css('strong.value').first.nil?
    quote_value = parsed_page.css('strong.value').first.text.gsub(',', '').to_i
  end
end
