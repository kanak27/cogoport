from typing import List
from pydantic import BaseModel, validator

class ConfigurationBase(BaseModel):
    country_code: str
    business_name: str
    requirements: List[str]

class ConfigurationCreate(ConfigurationBase):
    pass

class ConfigurationUpdate(BaseModel):
    business_name: str
    requirements: List[str]

    @validator("requirements")
    def validate_requirements(cls, v):
        if not v:
            raise ValueError("Requirements list cannot be empty")
        return v
    pass

class Configuration(ConfigurationBase):
    id: int

    class Config:
        orm_mode = True