class StatusInvestScraper
  private_class_method :new

  def self.call(ticker)
    url = "https://statusinvest.com.br/acoes/#{ticker}"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    quote_value = parsed_page.css('strong.value').first.text.gsub(',', '').to_i
  end
end
