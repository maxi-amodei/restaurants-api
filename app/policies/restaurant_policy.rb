class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant Owners can Update
  record.user == user
  end

  def create?
    # Any logged in user can create a restaurant
    !user.nil?
  end

  def destroy?
    record.user == user
  end
end
