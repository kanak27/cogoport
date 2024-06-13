from .database import Base
from pydantic import BaseModel
from sqlalchemy import Column, Integer, String, JSON

class Configuration(Base):
    __tablename__ = "Onboarding Requirements"

    country_code = Column(String, primary_key=True, unique=True, index=True)
    business_name = Column(String)
    requirements = Column(JSON)

class ConfigurationCreate(BaseModel):
    country_code: str
    business_name: str
    requirements: list[str]

class ConfigurationUpdate(BaseModel):
    business_name: str
    requirements: list[str]