class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|

      t.string :title #カラムを新しく追加
      t.string :body #カラムを新しく追加

      t.timestamps
    end
  end
end
