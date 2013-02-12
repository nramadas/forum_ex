class AddLastViewedUserPage < ActiveRecord::Migration
  def change
    add_column :users, :last_viewed_user_page, :datetime
  end
end
