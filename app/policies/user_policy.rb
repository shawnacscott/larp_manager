class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.is_chapter_staff_or_greater?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def permitted_attributes
    if user.is_chapter_staff_or_greater?
      [
        :id,
        role_ids: []
      ]
    else
      []
    end
  end

  def new?
    true
  end

  private

  def read?
    user.is_chapter_staff_or_greater? || user.id == record.id
  end

  def write?
    user.is_chapter_staff_or_greater? || user.id == record.id
  end
end
