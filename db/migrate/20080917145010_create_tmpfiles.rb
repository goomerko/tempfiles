class CreateTmpfiles < ActiveRecord::Migration
  def self.up
    create_table :tmpfiles do |t|
      t.integer :size 
      t.string :filename, :hexkey, :content_type
      t.datetime :destroy_datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :tmpfiles
  end
end
