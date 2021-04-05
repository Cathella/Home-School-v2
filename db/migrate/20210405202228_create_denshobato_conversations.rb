class CreateDenshobatoConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :denshobato_conversations do |t|
      t.boolean    :trashed,   default: false
      t.references :sender,    polymorphic: true, index: { name: 'conversation_polymorphic_sender' }
      t.references :recipient, polymorphic: true, index: { name: 'conversation_polymorphic_recipient' }

      t.timestamps null: false
    end
  end
end
