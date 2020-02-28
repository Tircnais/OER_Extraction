from sqlalchemy import create_engine, MetaData, Table
from sqlalchemy.orm import mapper, sessionmaker
from sqlalchemy import Column, Integer
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('mysql+pymysql://root:@192.168.56.1/oer', echo=True)
Base = declarative_base(engine)

class ontologia(Base):
    __tablename__ = 'ontologies'
    __table_args__ = {'autoload': True}

class sujetos(Base):
    __tablename__ = 'subjects'
    __table_args__ = {'autoload': True}

class predicados(Base):
    __tablename__ = 'predicates'
    __table_args__ = {'autoload': True}


def load_session():
    Session = sessionmaker(bind=engine)
    session = Session()
    return session
