class AddUserIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_introduction, :text
  end
end
