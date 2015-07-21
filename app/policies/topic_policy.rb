class TopicPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.admin?
  end

  def update?
    create?
  end

  def show?
    if record.public == true
        true
    else
      user.present? && user.admin?
    end
  end
end