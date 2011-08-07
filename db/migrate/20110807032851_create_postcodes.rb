class CreatePostcodes < ActiveRecord::Migration
  def self.up
    create_table :postcodes do |t|
      t.integer :number
      t.string :suburb

      t.timestamps
    end
    add_column :people, :postcode_id, :integer
    remove_column :people, :postcode
  end

  def self.down
    drop_table :postcodes
    remove_column :people, :postcode_id
    add_column :people, :postcode, :integer
  end
end
