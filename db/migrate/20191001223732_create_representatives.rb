class CreateRepresentatives < ActiveRecord::Migration[5.1]
  def change
    create_table :representatives do |t|
      t.string :name
      t.string :email
      t.string :rfc
      t.string :tel
      t.string :cel
      t.string :position

      t.timestamps
    end
  end
end
