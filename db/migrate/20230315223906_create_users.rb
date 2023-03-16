class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :maidenName
      t.integer :age
      t.string :gender
      t.string :email
      t.string :phone
      t.string :username
      t.string :password
      t.string :birthDate
      t.string :image
      t.string :bloodGroup
      t.integer :height
      t.integer :weight
      t.string :eyeColor
      t.jsonb :hair
      t.string :domain
      t.string :ip
      t.jsonb :address
      t.string :macAddress
      t.string :university
      t.jsonb :bank
      t.jsonb :company
      t.string :ein
      t.string :ssn
      t.string :userAgent

      t.timestamps
    end
  end
end
