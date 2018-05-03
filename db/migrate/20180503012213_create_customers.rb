class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :family_name, null: false, length: { maximum: 20 }
      t.string :given_name,  null: false, length: { maximum: 20 }
      t.string :email,       null: false

      t.timestamps
    end
    add_index :customers, :email, unique: true
    # indexというのはメルアドでuserを探す時にどこの位置に何があるかを知らせる。
    # 検索でデータを持ってくる項目だけに使う
    # 今回はemailにだけ適用。
    # オプションでunique: trueとしているのは同じメルアドで登録できないようにするため。
  end
end
