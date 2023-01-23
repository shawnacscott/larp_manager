class CharacterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_staff?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
