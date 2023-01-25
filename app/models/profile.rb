# == Schema Information
#
# Table name: profiles
#
#  id            :bigint           not null, primary key
#  for_acting_as :integer          default("player")
#  name          :string
#  status        :integer          default("active")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user
  has_many :characters

  enum :for_acting_as, {
    player: 0,
    superuser: 10_000
  }
  enum :status, {
    active: 0,
    inactive: 10_000
  }
end
