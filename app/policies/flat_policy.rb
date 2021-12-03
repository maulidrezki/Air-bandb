class FlatPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def create?
  #   return true
  # end

  # def update?
  #   recore.user == user
  # end

  def destroy?
    record.user == user
  end

end
