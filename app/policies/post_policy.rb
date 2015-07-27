class PostPolicy < ApplicationPolicy
  def index?
    true
  end

# Assignment 39 ///////////////////////

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

# //////////////////////////////////////
end