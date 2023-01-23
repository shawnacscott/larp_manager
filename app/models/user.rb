# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :characters
  after_create :assign_default_role

  def is_staff?
    self.has_any_role?(:national_staff, :superuser, *all_chapter_roles_for_user)
  end

  def all_chapter_roles_for_user
    Array.wrap(director_roles) + Array.wrap(chapter_staff_roles)
  end

  def all_chapter_role_chapters
    self.chapter_staff_of_chapters.or(self.director_of_chapters)
  end

  def director_roles
    director_of_chapters.collect do |chapter|
      { name: :director, resource: chapter }
    end
  end

  def director_of_chapters
    Chapter.with_role(:director, self)
  end

  def chapter_staff_roles
    chapter_staff_of_chapters.collect do |chapter|
      { name: :chapter_staff, resource: chapter }
    end
  end

  def chapter_staff_of_chapters
    Chapter.with_role(:chapter_staff, self)
  end

  private

  def assign_default_role
    self.add_role(:player) if self.roles.blank?
  end
end
