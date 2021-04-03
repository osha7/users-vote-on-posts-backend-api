class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|

      t.integer :like, :default => 0
      t.integer :dislike, :default => 0
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
