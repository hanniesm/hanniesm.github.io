class CreateBaseTables < ActiveRecord::Migration[4.2]

  def change
    create_table :users do |t|
      t.string :nickname
      t.references :location
      t.timestamps
    end

    create_table :softwares do |t|
      t.string :software_name
      t.text :software_description
      t.string :developer
      t.date :release_date
      t.date :crack_date
      t.string :cracker_group
      t.string :software_tags
      t.timestamps
    end

    create_table :packages do |t|
      t.references :sender
      t.string :sender_affiliation
      t.references :recipient
      t.date :date
      t.string :letter_url
      t.references :software
      t.text :content_description
      t.string :content_tags
      t.timestamps
    end

    create_table :locations do |t|
      t.string :place_name
      t.integer :longitude
      t.integer :latitude
      t.timestamps
    end

      add_foreign_key :packages, :users, column: :sender_id, primary_key: :id
      add_foreign_key :packages, :users, column: :recipient_id, primary_key: :id

  end

end