import scrapy
from ..items import *

class VocabularioSpider(scrapy.Spider):
    name = 'onto'

    def start_requests(self):
        urls = [
            'http://xmlns.com/foaf/spec/'
            # ontologia FOAF
        ]
        for url in urls:
            print("\n\nNew Url", url)
            yield scrapy.Request(url=url, callback=self.parse_item)

    def parse_item(self, response):
        prefijoFOAF = "http://xmlns.com/foaf/spec/"
        fk_onto = 2 # Buscar el ID de foaf
        prefix = "foaf:"

        labelClases = response.xpath('//div[@class="azlist"]/p[1]/a/text()').getall()
        uriClases = response.xpath('//div[@class="azlist"]/p[1]/a/@href').getall()
        prefixClases = []

        labelPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/text()').getall()
        uriPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/@href').getall()
        prefixPropiedades = []
        # specterm
        print("\n%s\n", uriClases)
        ####
        for i in range(len(uriClases)):
            uriClases[i] = prefijoFOAF + uriClases[i]
            prefixClases.append(prefijoFOAF+labelClases)
            print("::", uriClases[i])
            yield SujetoItem(s_prefix=str(prefixClases[i]), s_uri=str(uriClases[i]), s_label=str(labelClases[i]), s_description="")

        
        for i in range(len(uriPropiedades)):
            uriPropiedades[i] = prefijoFOAF + uriPropiedades[i]
            prefixPropiedades.append(prefijoFOAF+labelPropiedades)
            print("::", uriPropiedades[i])
            yield PredicadoItem(p_prefix=str(prefixPropiedades), p_uri=str(uriPropiedades[i]), p_label=str(labelPropiedades[i]), p_description="")

        # len(arr) length() size()
        # yield SujetoItem(s_prefix=self.name, s_uri="hasRaw", s_label=str(resp), s_description=response.url)
        # yield PredicadoItem(p_prefix=self.name, p_uri="hasRaw", p_label=str(resp), p_description=response.url)
 
    """
    def parse_list(self, response):
        next_page = response.xpath('//a/@href').getall()
        next_page = ["%s%s" % (s, '?show=full') for s in next_page]
        if next_page is not None:
            for next in next_page:
                print("Next : ", next)
                yield response.follow(next, self.parse_item)
        else:
            print('next_page is None :(')
    def parse(self, response):
        next = response.xpath('//a/@href').getall()
        if next is not None:
            for n in next:
                print('Next topic : ', n)
                yield response.follow(n, self.parse_list)
        else:
            print('next is None :( ')

    start_urls = ['https://blog.scrapinghub.com']

    def parse(self, response):
        for title in response.css('.post-header>h2'):
            yield {'title': title.css('a ::text').get()}

        for next_page in response.css('a.next-posts-link'):
            yield response.follow(next_page, self.parse)
    """
