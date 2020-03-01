# from sqlalchemy import create_engine, MetaData, Table
# from sqlalchemy import Column, Integer
from sqlalchemy.orm import mapper, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://root@localhost/oer', echo=True)
# mysqlclient (a maintained fork of MySQL-Python)

Base = declarative_base(engine)

class Ontologia(Base):
    __tablename__ = 'ontologies'
    __table_args__ = {'autoload': True}

class Sujetos(Base):
    __tablename__ = 'subjects'
    __table_args__ = {'autoload': True}

class Predicados(Base):
    __tablename__ = 'predicates'
    __table_args__ = {'autoload': True}


def load_session():
    Session = sessionmaker(bind=engine)
    session = Session()
    return session
