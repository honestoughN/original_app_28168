class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '好きなこと' },
    { id: 3, name: '得意なこと' },
    { id: 4, name: '重要なこと' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :hearts
end
