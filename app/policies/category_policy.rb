class CategoryPolicy < ApplicationPolicy
  def index?
    true
  end
  

  def update?
    create?
  end
end