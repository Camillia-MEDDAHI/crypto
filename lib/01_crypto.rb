require 'open-uri'
require 'nokogiri'
require 'rspec'

url = Nokogiri::HTML( URI.open ( "https://coinmarketcap.com/" )  )

arr_nameValue=[]
arr_price=[]

 url.xpath('//*[@class="cmc-table__column-name sc-1kxikfi-0 eTVhdN"]').each do |nameValue|
     arr_nameValue << nameValue.text
     print arr_nameValue
 end



 url.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/*[@class="cmc-link"]').each do |value|
     arr_price << value.text.delete_prefix('$').gsub(',','').to_f
    # print arr_price
 end
 fusion=[{}]
 for x in 0..(arr_price.length-1)

    fusion[x] = {arr_nameValue[x] => arr_price[x]}
 end

puts fusion