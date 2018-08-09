# setting a type attribute on user table enables single table inheritance; when using AdminUser.create(...) it sets the type equal to the AdminUser class name 
class AdminUser < User

end
