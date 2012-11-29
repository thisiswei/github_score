class AddGravatarIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :gravatar_id,:string
  end
end
