from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy import Boolean, Column, String, Float
import uuid

from ..utils.base_class import BaseClass


class User(BaseClass):
    id = Column(UUID(as_uuid=True), primary_key=True, index=True,
                default=uuid.uuid4)
    full_name = Column(String, index=True)
    email = Column(String, unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    date_of_birth = Column(Float, index=True)
    is_active = Column(Boolean(), default=True)
