class Shippinghash < ActiveHash::Base
  self.data = [
      {value: '１〜２日で発送', name: '１〜２日で発送'}, {value: '２〜３日で発送', name: '２〜３日で発送'}, {value: '４〜７日で発送', name: '４〜７日で発送'}
  ]
end