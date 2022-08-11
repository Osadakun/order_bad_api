class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :member1
      t.string :member2
      t.string :member3
      t.string :member4
      t.string :member5
      t.string :member6
      t.string :member7
      t.integer :user_id

      t.timestamps
    end
  end
end
