class Statushash < ActiveHash::Base
  self.data = [
      {value: '新品、未使用', name: '新品、未使用'}, {value: '未使用に近い', name: '未使用に近い'}, {value: '目立った傷や汚れなし', name: '目立った傷や汚れなし'},
      {value: 'やや傷や汚れあり', name: 'やや傷や汚れあり'}, {value: '傷や汚れあり', name: '傷や汚れあり'}, {value: '全体的に状態が悪い', name: '全体的に状態が悪い'}
  ]
end