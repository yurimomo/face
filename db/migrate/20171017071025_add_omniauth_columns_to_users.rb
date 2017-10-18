class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
  	# 未入力を許さないNOT NULL制約と未入力時は空として扱うデフォルト値を設定しています。


    add_column :users, :uid, :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :image_url, :string

   # カラムにインデックス（索引）を設定して、同じものは複数存在できないようにするユニーク制約を設定しています
    add_index :users, [:uid, :provider], unique: true

  end
end
