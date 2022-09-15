from typing import Any
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from .service import user_service
from .schema import User as UserSchema, UserCreate, UserUpdate
from .dependency import get_db

router = APIRouter()


@router.post("/", response_model=UserSchema)
def create_user(
    *,
    db: Session = Depends(get_db),
    user_in: UserCreate,
) -> Any:
    user = user_service.get_by_email(db, email=user_in.email)
    if user:
        raise HTTPException(
            status_code=400,
            detail="The user with this email already exists in the system.",
        )
    user = user_service.create(db, obj_in=user_in)
    return user


@router.put("/{user_id}", response_model=UserSchema)
def update_user(
    *,
    db: Session = Depends(get_db),
    user_id: int,
    user_in: UserUpdate
) -> Any:
    user = user_service.get(db, id=user_id)
    if not user:
        raise HTTPException(
            status_code=404,
            detail="The user with this email does not exist in the system",
        )
    user = user_service.update(db, db_obj=user, obj_in=user_in)
    return user
