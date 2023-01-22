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
end
