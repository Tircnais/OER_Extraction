# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class OntoItem(scrapy.Item):
    #info de la ontologia
    o_id = scrapy.Field()
    o_name = scrapy.Field()
    o_description = scrapy.Field()
    o_url = scrapy.Field()

class SujetoItem(scrapy.Item):
    s_prefix = scrapy.Field()
    s_uri = scrapy.Field()
    s_label = scrapy.Field()
    s_description = scrapy.Field()

class PredicadoItem(scrapy.Item):
    p_prefix = scrapy.Field()
    p_uri = scrapy.Field()
    p_label = scrapy.Field()
    p_description = scrapy.Field()