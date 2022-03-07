class ChangePhotoTypeToText < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :text
  end
end
