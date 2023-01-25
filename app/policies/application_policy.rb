# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :profile, :record

  def initialize(profile, record)
    @profile = profile
    @record = record
  end

  def index?
    profile.superuser? || false
  end

  def show?
    profile.superuser? || false
  end

  def create?
    profile.superuser? || false
  end

  def new?
    create?
  end

  def update?
    profile.superuser? || false
  end

  def edit?
    update?
  end

  def destroy?
    profile.superuser? || false
  end

  class Scope
    def initialize(profile, scope)
      @profile = profile
      @scope = scope
    end

    def resolve
      if profile.superuser?
        scope.all
      else
        raise NotImplementedError, "You must define #resolve in #{self.class}"
      end
    end

    private

    attr_reader :profile, :scope
  end
end
