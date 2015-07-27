class PostPolicy < ApplicationPolicy
  def index?
    user.present?
  end

# Assignment 39 ///////////////////////

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user
        if user.admin? || user.moderator?
          scope.all
        else
          scope.where(:published => true)
        end
      else
        scope.where(:published => true)
      end
    end
  end

# //////////////////////////////////////
end