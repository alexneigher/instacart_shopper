class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :region
      t.string :phone
      t.string :email
      t.string :phone_type
      t.string :source
      t.boolean :over_21
      t.text :reason
      t.string :workflow_state
      t.boolean :accepts_background_check, null: false, default: false

      t.timestamps null: false
    end
  end
end
