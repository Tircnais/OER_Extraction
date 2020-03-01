import scrapy
from ..items import *

class VocabularioSpider(scrapy.Spider):
    name = 'onto'
    allowed_domains = "http://xmlns.com"
    start_urls = [
        'http://xmlns.com/foaf/spec/'
        # ontologia FOAF
    ]
    """    
    def start_requests(self):
        start_urls = [
            'http://xmlns.com/foaf/spec/'
            # ontologia FOAF
        ]
        for url in start_urls:
            # print("\n\nNew Url", url)
            yield scrapy.Request(url=url, callback=self.parse)
    """
    def parse(self, response):
        prefijoFOAF = "http://xmlns.com/foaf/spec/"
        fk_onto = 2 # Buscar el ID de foaf
        prefijo = "foaf:"

        labelClases = response.xpath('//div[@class="azlist"]/p[1]/a/text()').getall()
        uriClases = response.xpath('//div[@class="azlist"]/p[1]/a/@href').getall()
        prefixClases = []

        labelPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/text()').getall()
        uriPropiedades = response.xpath('//div[@class="azlist"]/p[2]/a/@href').getall()
        prefixPropiedades = []

        # Se accede al elemento USANDO EL INDICE
        for i in range(len(labelClases)):
            # print("URI: %s\t\t\t\tLabel:\t%s" % (uriClases[i].split("term_")[1] , labelClases[i]))
            # Estructura para controlar la 
            if uriClases[i].split("term_")[1] == labelClases[i]:
                prefixClases.append(prefijo+labelClases[i])
                uriClases[i] = prefijoFOAF + uriClases[i]
                # print("Clases %d numero\nPrejifo:: %s\n\n" % (c, prefixClases[i]))
                yield SujetoItem(fkOnto=2, sPrefix=str(prefixClases[i]), sUri=str(uriClases[i]), sLabel=str(labelClases[i]), sDescription="")
        
        # Se accede al elemento USANDO EL INDICE
        for i in range(len(labelPropiedades)):
            # print("URI: %s\t\t\t\tLabel:\t%s" % (uriPropiedades[i].split("term_")[1] , labelPropiedades[i]))
            if uriPropiedades[i].split("term_")[1] == labelPropiedades[i]:
                prefixPropiedades.append(prefijo+labelPropiedades[i])
                uriPropiedades[i] = prefijoFOAF + uriPropiedades[i]
                # print("Propiedad %d numero\n\nPrefixPropiedades:: %s\n\nURI:: %s\n\n" % (c, prefixPropiedades[i], uriPropiedades[i]))
                yield PredicadoItem(fkOnto=2, pPrefix=str(prefixPropiedades[i]), pUri=str(uriPropiedades[i]), pLabel=str(labelPropiedades[i]), pDescription="")
        print("Subject encontrados: %d" % len(labelClases)) #13
        print("Predicates encontrados: %d" % len(labelPropiedades)) #62
        # len(arr) length() size()
