class CreateFailures < ActiveRecord::Migration
  def change
    create_table :failures do |t|
      t.string         :title
      t.text           :overview
      t.text           :timeline
      t.text           :cause
      t.text           :damage
      t.text           :action
      t.text           :prevention
      t.text           :lesson
      t.timestamps
    end
  end
end
