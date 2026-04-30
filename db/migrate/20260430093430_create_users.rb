class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birth_date, null: false
      t.string :cpf, null: false
      t.string :passport
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
