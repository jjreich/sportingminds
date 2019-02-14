class CreateAccountablityPartnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :accountablity_partnerships do |t|
      t.integer :user_id
      t.integer :accountability_partner_id
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end
