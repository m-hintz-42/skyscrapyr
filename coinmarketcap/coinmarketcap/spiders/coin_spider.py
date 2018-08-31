import scrapy

class CoinSpider(scrapy.Spider):
    name = "coin"

    def start_requests(self):
        url = "https://coinmarketcap.com/all/views/all/"
        yield scrapy.Request(url=url, callback=self.parse)