from typing import Any, Dict, Optional, Union
from sqlalchemy.orm import Session

from .model import User as UserModel
from .schema import UserCreate, UserUpdate
from ..utils.crud import CRUDBase
from ..utils.security import get_password_hash


class UserService(CRUDBase[UserModel, UserCreate, UserUpdate]):
    def get_by_email(self, db: Session, *, email: str) -> Optional[UserModel]:
        return db.query(UserModel).filter(UserModel.email == email).first()

    def create(self, db: Session, *, obj_in: UserCreate) -> UserModel:
        db_obj = UserModel(
            email=obj_in.email,
            hashed_password=get_password_hash(obj_in.password),
            full_name=obj_in.full_name,
            date_of_birth=obj_in.date_of_birth,
        )
        db.add(db_obj)
        db.commit()
        db.refresh(db_obj)
        return db_obj

    def update(
        self, db: Session, *, db_obj: UserModel, obj_in: Union[UserUpdate, Dict[str, Any]]
    ) -> UserModel:
        if isinstance(obj_in, dict):
            update_data = obj_in
        else:
            update_data = obj_in.dict(exclude_unset=True)
        if update_data["password"]:
            hashed_password = get_password_hash(update_data["password"])
            del update_data["password"]
            update_data["hashed_password"] = hashed_password
        return super().update(db, db_obj=db_obj, obj_in=update_data)

    def is_active(self, user: UserModel) -> bool:
        return user.is_active


user_service = UserService(UserModel)
