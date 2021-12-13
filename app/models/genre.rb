class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'IT用語' },
    { id: 2, name: 'HTML' },
    { id: 3, name: 'CSS' },
    { id: 4, name: 'Ruby' },
    { id: 5, name: 'Ruby on Rails' },
    { id: 6, name: 'JavaScript' },
    { id: 7, name: 'Git Hub' },
    { id: 8, name: 'Linuxコマンド' },
    { id: 9, name: 'Heroku' },
    { id: 10, name: 'AWS' },
    { id: 11, name: 'SQL' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
