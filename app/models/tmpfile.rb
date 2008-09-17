# == Schema Information
# Schema version: 20080917145010
#
# Table name: tmpfiles
#
#  id               :integer         not null, primary key
#  size             :integer
#  filename         :string(255)
#  checksum         :string(255)
#  content_type     :string(255)
#  destroy_datetime :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

require 'md5'

class Tmpfile < ActiveRecord::Base

  has_attachment :max_size => 50.megabytes,
    :path_prefix => "files"

  validates_as_attachment

  before_validation_on_create :set_checksum, :set_destroy_datetime


  def set_checksum
    self.hexkey = Digest::SHA1.hexdigest(Time.now.to_s + rand(12341234).to_s)[1..8]
  end

  def set_destroy_datetime
    self.destroy_datetime = Time.now + 3.days
  end
end
