from django.contrib import admin
from users.models import User, DjangoUser

# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ('nickname',)
    list_display_links = ('nickname',)
    fieldsets = [
        ('유저 닉네임 설정', {'fields': ['nickname']}),
    ]

class DjangoUserAdmin(admin.ModelAdmin):
    fieldsets = []

admin.site.register(User, UserAdmin)
admin.site.register(DjangoUser, DjangoUserAdmin)