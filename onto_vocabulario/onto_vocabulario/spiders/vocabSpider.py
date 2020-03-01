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
            # print("\n\nNew Url", url)
            yield scrapy.Request(url=url, callback=self.parse_item)
    
    def parse_item(self, response):
        prefijoFOAF = "http://xmlns.com/foaf/spec/"
        fk_onto = 2 # Buscar el ID de foaf
        prefijo = "foaf:"

        labelClases = response.xpath('//div[@class="azlist"]/p[1]/a/text()').getall()
        uriClases = response.xpath('//div[@class="azlist"]/p[1]/a/@href').getall()
        prefixClases = []

        labelPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/text()').getall()
        uriPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/@href').getall()
        prefixPropiedades = []
        # specterm
        # ####
        
        c = 0
        for i in uriClases:
            print("Elemento:: %s Numero %d" % (i, c))
            uriClases[c] = prefijoFOAF + uriClases[c]
            prefixClases.append(prefijo+labelClases[c])
            print("Clases %d numero\nPrejifo:: %s\n\n" % (c, prefixClases[c]))
            yield SujetoItem(fkOnto=2, sPrefix=str(prefixClases[c]), sUri=str(uriClases[c]), sLabel=str(labelClases[c]), sDescription="")
            c=c+1
        
        c=0
        for i in uriPropiedades:
            print("Cantidad de elementos %d en URI" % c)
            # len(uriPropiedades)
            uriPropiedades[c] = prefijoFOAF + uriPropiedades[c]
            prefixPropiedades.append(prefijoFOAF+labelPropiedades[c])
            print("Propiedad %d numero\n\nPrefixPropiedades:: %s\n\nURI:: %s\n\n"
             % (c, prefixPropiedades[c], uriPropiedades[c]))
            yield PredicadoItem(fkOnto=2, pPrefix=str(prefixPropiedades[c]), pUri=str(uriPropiedades[c]), pLabel=str(labelPropiedades[c]), pDescription="")
            c=c+1
            print("paso")
        
        # len(arr) length() size()
        # yield SujetoItem(sPrefix=str(prefixClases[c]), sUri=str(uriClases[c]), sLabel=str(labelClases[c]), sDescription="")
        # yield PredicadoItem(pPrefix=str(prefixPropiedades[c]), pUri=str(uriPropiedades[c]), pLabel=str(labelPropiedades[c]), pDescription="")
