require_relative '../../config/database'

class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :email
      t.string :password
    end

    create_table :questions do |t|
      t.string :description
      t.belongs_to :user, index: true
    end

    create_table :answers do |t|
      t.string :description
      t.belongs_to :question, index: true
      t.belongs_to :user, index: true
    end

    add_index :answers, [:question_id, :user_id], :unique => true
  end
end