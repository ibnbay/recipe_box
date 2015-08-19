class Recipe < ActiveRecord::Base
  has_many :bahans
  has_many :tahapans

  accepts_nested_attributes_for :bahans, reject_if: proc{|attributes| attributes['name'].blank?}, allow_destroy: true
  accepts_nested_attributes_for :tahapans, reject_if: proc{|attributes| attributes['step'].blank?}, allow_destroy: true

  validates :title, :description, :image, presence: true

  has_attached_file :image, :styles => { :medium => "400x400#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
