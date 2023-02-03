# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_characters_on_profile_id  (profile_id)
#  index_characters_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (user_id => users.id)
#
class Character < ApplicationRecord
  belongs_to :profile
end
