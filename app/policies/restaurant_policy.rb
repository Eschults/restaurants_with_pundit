class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope <=> Restaurant
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    is_user_the_owner?
  end

  def destroy?
    is_user_the_owner?
  end

  private

  def is_user_the_owner?
    # current_user <=> user
    # @restaurant  <=> record
    # @restaurant.user == current_user
    record.user == user || user.admin?
  end
end
