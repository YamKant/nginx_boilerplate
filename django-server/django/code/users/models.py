from django.db import models
from django.contrib.auth.models import User as AuthUser

# Create your models here.
class User(models.Model):
    user_seq = models.AutoField(primary_key=True)
    nickname = models.CharField(default="-", max_length=58)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'users'

# NOTE: 회원가입시, 장고 회원가입인 경우 auth_user와 user를 엮습니다.
class DjangoUser(models.Model):
    django_user_seq = models.AutoField(primary_key=True)
    auth_user_seq = models.ForeignKey(AuthUser, db_column='id', on_delete=models.PROTECT)
    user_seq = models.ForeignKey(User, db_column='user_seq', on_delete=models.PROTECT)

    class Meta:
        managed = True
        db_table = 'djangoUsers'