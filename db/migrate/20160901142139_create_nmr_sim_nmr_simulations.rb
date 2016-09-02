class CreateNmrSimNmrSimulations < ActiveRecord::Migration
  def change
    create_table :nmr_sim_nmr_simulations do |t|
      t.integer :molecule_id
      t.text :response_1h
      t.text :response_13c
      t.text :source
      t.datetime :deleted_at

      t.timestamps null: false
    end

    add_index :nmr_sim_nmr_simulations, :molecule_id
    add_index :nmr_sim_nmr_simulations, :deleted_at
  end
end
