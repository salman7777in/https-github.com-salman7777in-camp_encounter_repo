class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_index :users, :confirmation_token,   unique: true
    User.update_all confirmed_at: DateTime.now
  end
  def down
    remove_index :users, :confirmation_token
    remove_columns :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :users, :unconfirmed_email # Only if using reconfirmable
  end
end
