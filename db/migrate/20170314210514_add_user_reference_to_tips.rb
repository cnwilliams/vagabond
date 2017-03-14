class AddUserReferenceToTips < ActiveRecord::Migration[5.0]
  def change
    add_reference :tips, :user, foreign_key: true
  end
end
