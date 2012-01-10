class CreateInternalMessages < ActiveRecord::Migration
  def self.up
    create_table :internal_messages do |t|
      t.string :subject
      t.integer :target_user_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :internal_messages
  end
end
