from fastapi import APIRouter

from .user import router as user_router
from .auth import router as auth_router

api_router = APIRouter()
api_router.include_router(user_router.router, tags=["user"])
api_router.include_router(auth_router.router, tags=["auth"])
