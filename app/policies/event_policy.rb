# TODO: Add explainer comments
class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    # Need to check for a chapter staff role for any chapter,
    # since a new event record won't have a chapter assigned
    # yet that we can check against
    user.has_role?(:chapter_staff, :any) || write?
  end

  def permitted_attributes
    [
      :chapter_id,
      :description,
      :end_date,
      :name,
      :start_date
    ]
  end

  private

  def read?
    true
  end

  def write?
    user.all_chapter_role_chapters.include?(record.chapter) || user.has_any_role?(:national_staff, :superuser)
  end
end
