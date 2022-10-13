require 'nokogiri'
require 'open-uri'

def get_link

    url = []
    link = []

    general = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))

    general.css('#deputes-list//li//a').each do |el|
        link.push(el["href"])
    end

    link.each do |i|
        url.push("https://www2.assemblee-nationale.fr/" + i.slice(1..))
    end

    return url

end

def get_email_and_name 

    email = []
    name = []
    truemane = []

    3.times do |i|
        pomme = Nokogiri::HTML(URI.open(get_link[i]))
        email.push(pomme.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text) 
        name.push(pomme.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text) 
    end

    name.each do |i|

    truemane.push(i.slice!(3..))

    end    

    string = truemane.join(" ")
    tab = string.split
    truename = []
    truesurname = []

    j = 0
    tab.each do |i|
        if j % 2 == 0
            truename.push(i)
        else
            truesurname.push(i)
        end
        j = j + 1
    end

    finaltab = []

    email.length.times do |i|
        finaltab.push({"first_name" => truename[i],"last_name" => truesurname[i],"email" => email[i] })
    end
    
    return finaltab 
end

def testass(nb)
    return get_email_and_name[nb]
end

  
