# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
# Solo para visualizar el registro
import json

from .model import *

class OntoVocabularioPipeline(object):
    def process_item(self, item, spider):
        # print("Saving item %s\n" % str(item))
        """
        {'fkOnto': 2, 'pDescription': '',
         'pLabel': 'phone', 'pPrefix': 'http://xmlns.com/foaf/spec/phone',
         'pUri': 'http://xmlns.com/foaf/spec/#term_phone'}
        """
        
        session = load_session()
        # key ITEM
        if 'sPrefix' in item:
            session.add(Sujetos(fk_onto=item["fkOnto"], s_prefix=item["sPrefix"], s_uri=item["sUri"], s_label=item["sLabel"], s_description=item["sDescription"]))
        else:
            session.add(Predicados(fk_onto=item["fkOnto"], p_prefix=item["pPrefix"], p_uri=item["pUri"], p_label=item["pLabel"], p_description=item["pDescription"]))

        # hasta el commit
        session.commit()
        return 'New added'

"""
# some JSON:
x = '{ "name":"John", "age":30, "city":"New York"}'

# parse x:
y = json.loads(x)

# the result is a Python dictionary:
print(y)
a = {"Geeks": 1, "for": 2, "Geeks": 3}
print("Using json.loads(): %s" % str(json.loads(a)))

"""