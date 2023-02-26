class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :alexa_Id

      t.timestamps
    end
  end
end
