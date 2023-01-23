# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :string
#  end_date    :date
#  name        :string
#  start_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chapter_id  :bigint           not null
#
# Indexes
#
#  index_events_on_chapter_id  (chapter_id)
#
# Foreign Keys
#
#  fk_rails_...  (chapter_id => chapters.id)
#
class Event < ApplicationRecord
  belongs_to :chapter
end
