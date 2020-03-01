# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class OntoItem(scrapy.Item):
    #info de la ontologia
    oId = scrapy.Field()
    oName = scrapy.Field()
    oDescription = scrapy.Field()
    oUrl = scrapy.Field()

class SujetoItem(scrapy.Item):
    fkOnto = scrapy.Field()
    sPrefix = scrapy.Field()
    sUri = scrapy.Field()
    sLabel = scrapy.Field()
    sDescription = scrapy.Field()

class PredicadoItem(scrapy.Item):
    fkOnto = scrapy.Field()
    pPrefix = scrapy.Field()
    pUri = scrapy.Field()
    pLabel = scrapy.Field()
    pDescription = scrapy.Field()