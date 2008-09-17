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

  before_validation_on_create :set_checksum


  def set_checksum
    self.checksum = MD5.md5 self.uploaded_data
  end
end
