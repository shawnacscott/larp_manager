# frozen_string_literal: true

# TODO: Add explainer comments
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    read?
  end

  def show?
    read?
  end

  def create?
    write?
  end

  def new?
    write?
  end

  def update?
    write?
  end

  def edit?
    write?
  end

  def destroy?
    write?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

  private

  def read?
    user.is_superuser?
  end

  def write?
    user.is_superuser?
  end
end
