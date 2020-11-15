class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :permissions, :dependent => :destroy

  def administrator?
    permissions.where(:role => :administrator).any?
  end
end
