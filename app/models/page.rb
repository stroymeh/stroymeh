class Page < ActiveRecord::Base
  acts_as_taggable

  belongs_to :section

  has_many :attachments, :dependent => :destroy

  validates_presence_of :title, :section_id

  scope :ordered, -> { order('updated_at desc') }
  scope :sorted, -> { order('position asc') }

  alias_attribute :to_s, :title

  has_ancestry :cache_depth => true

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :finders]

  def should_generate_new_friendly_id?
    true
  end

  def sort_childrens(items)
    items.each_with_index do |id, index|
      Page.find(id).update_attributes(:position => index + 1)
    end
  end
end
