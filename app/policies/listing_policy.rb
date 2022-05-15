# class ListingPolicy
#     attr_reader :user, :record
  
#     def initialize(user, record)
#       @user = user
#       @record = record
#     end
  
#     def index?
#       true
#     end
  
#     def show?
#       true
#     end
  
#     def create?
#       true
      
#     end
  
#     def new?
#       create?
#     end
  
#     def update?
#       return (@user.has_role?(:admin) || @user.id == @listing.user_id)
#     end
  
#     def edit?
#       update?
#     end
  
#     def destroy?
#       update?
#     end
  
#     class Scope
#       def initialize(user, scope)
#         @user = user
#         @scope = scope
#       end
  
#       def resolve
#         raise NotImplementedError, "You must define #resolve in #{self.class}"
#       end
  
#       private
  
#       attr_reader :user, :scope
#     end
#   end