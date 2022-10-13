require 'nokogiri'
require 'open-uri'

def get_citty_name

    cityname = []

    maire = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/herault.html'))

    maire.css('.lientxt').each do |el|
        cityname.push(el.text) 
    end
    return cityname

end

def get_townhall_urls

    link = []
    url = [] 

    maire = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/herault.html'))

    maire.css('.lientxt').each do |el|
        link.push(el["href"]) 
    end

    link.each do |i|
    url.push("http://annuaire-des-mairies.com" + i.slice(1..))
    end

    return url

end

def get_all_townhall_email

    email = []

    get_townhall_urls.length.times do |i|
        pomme = Nokogiri::HTML(URI.open(get_townhall_urls[i]))

        email.push(pomme.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text) 
    end

    final = Hash[get_citty_name.zip(email)]

    return final.inspect

end

def get_townhall_email(townhall_url)
    maire = Nokogiri::HTML(URI.open(townhall_url))
    return maire.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

#puts get_citty_name
#puts get_townhall_urls
#puts get_all_townhall_email
#puts get_townhall_email("http://annuaire-des-mairies.com/34/agde.html")