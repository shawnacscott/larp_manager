class CharacterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_any_role?(:national_staff, :superuser)
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def permitted_attributes
    base_attrs = [ :name ]

    if user.is_national_staff_or_greater?
      base_attrs.merge(:user_id)
    else
      base_attrs
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  private

  def read?
    user.has_any_role?(:national_staff, :superuser) || record.user == user
  end

  def write?
    read?
  end
end
