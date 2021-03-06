class Category < ActiveHash::Base
  self.data = [
    {id: 1, name:'--'},
    {id: 2, name:'和食'},
    {id: 3, name:'丼もの'},
    {id: 4, name:'粉物'},
    {id: 5, name:'アジア'},
    {id: 6, name:'中華'},
    {id: 7, name:'イタリアン'},
    {id: 8, name:'フレンチ'},
    {id: 9, name:'肉料理'},
    {id: 10, name:'魚料理'},
    {id: 11, name:'鍋'},
    {id: 12, name:'デザート'}
  ]

  include ActiveHash::Associations
  has_many :recipes
  
end