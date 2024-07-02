from fastapi import FastAPI, HTTPException, Depends, APIRouter, status
from sqlalchemy.orm import Session
from ..database import SessionLocal, engine, get_db
from ..models import Configuration
from ..schemas import ConfigurationCreate as ConfigurationCreateSchema
from ..schemas import ConfigurationUpdate as ConfigurationUpdateSchema

router = APIRouter()

@router.post('/create_configuration')
def create_configuration(config: ConfigurationCreateSchema, db: Session = Depends(get_db)):
    db_config = Configuration(**config.dict())
    db.add(db_config)
    db.commit()
    db.refresh(db_config)
    return db_config

@router.get('/get_configuration/{country_code}')
def get_configuration(country_code: str, db: Session = Depends(get_db)):
    config = db.query(Configuration).filter(Configuration.country_code == country_code).first()
    if config is None:
        raise HTTPException(status_code=404, detail="Configuration not found")
    return config

@router.post('/update_configuration/{country_code}')
def update_configuration(country_code: str, config_update: ConfigurationUpdateSchema, db: Session = Depends(get_db)):
    db_config = db.query(Configuration).filter(Configuration.country_code == country_code).first()
    if db_config is None:
        raise HTTPException(status_code=404, detail="Configuration not found")
    for key, value in config_update.dict().items():
        setattr(db_config, key, value)
    db.commit()
    db.refresh(db_config)
    return db_config

@router.delete('/delete_configuration/{country_code}')
def delete_configuration(country_code: str, db: Session = Depends(get_db)):
    db_config = db.query(Configuration).filter(Configuration.country_code == country_code).first()
    if db_config is None:
        raise HTTPException(status_code=404, detail="Configuration not found")
    db.delete(db_config)
    db.commit()
    return {"message": "Configuration deleted successfully"}