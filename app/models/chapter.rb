# == Schema Information
#
# Table name: chapters
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chapter < ApplicationRecord
  after_create :create_chapter_roles
  resourcify

  private

def create_chapter_roles(id)
  Role.create!(
    name: :chapter_staff,
    resource_type: "Chapter",
    resource_id: id
  )
  Role.create!(
    name: :director,
    resource_type: "Chapter",
    resource_id: id
  )

  nil
end
end
