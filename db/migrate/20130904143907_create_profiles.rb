class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      
      t.string      :website,           :unique => true, :default => ""
      t.string      :twitter,           :unique => true, :default => ""
      t.string      :facebook,          :unique => true, :default => ""
      t.string      :phone_number,      :unique => true, :default => ""
      t.string      :email,             :unique => true, :default => ""

      t.string      :owner_name                        , :default => ""
      t.string      :company_name,      :unique => true, :default => ""
      t.text        :description                       , :default => ""

      t.string      :url,               :unique => true, :default => ""
      t.index       :url,               :unique => true

      t.references  :user, index: true

      t.timestamps
    end
  end
end
