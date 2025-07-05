class AddTitleAndOpinionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :title, :string
    add_column :books, :opinion, :text
  end
end
