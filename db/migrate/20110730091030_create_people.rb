class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :postcode
      t.string :email
      t.string :email_domain
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
