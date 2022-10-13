require 'nokogiri'
require 'open-uri'

def datascrap

    doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

    name = []
    price = []

    doc.css('.cmc-table__column-name--name').each do |el|
    name.push(el.text)
    end

    doc.css('.sc-131di3y-0 .cmc-link').each do |el|
        price.push(el.text)
    end
    
    globalhash = Hash[name.zip(price)]

    return globalhash
end

def test(nb)
    return datascrap.keys[nb]
end


