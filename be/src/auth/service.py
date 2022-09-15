from typing import Optional
from sqlalchemy.orm import Session

from ..user.model import User as UserModel
from ..user.service import user_service
from ..utils.security import verify_password


class AuthService:
    def authenticate(self, db: Session, *, email: str, password: str) -> Optional[UserModel]:
        user = user_service.get_by_email(db, email=email)
        if not user:
            return None
        if not verify_password(password, user.hashed_password):
            return None
        return user


auth_service = AuthService()
