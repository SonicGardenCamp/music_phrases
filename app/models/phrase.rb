class Phrase < ApplicationRecord
    # 必須項目のバリデーション
    validates :content, presence: true
    validates :music_title, presence: true
    validates :comment, presence: true
    validates :author_name, presence: true
    validates :play_url, presence: true
    validates :artist_name, presence: true
  
    # URLのフォーマット確認
    validates :play_url, format: URI::regexp(%w[http https])
  
    # 長さの制限
    validates :content, length: { maximum: 100 } 
    validates :comment, length: { maximum: 1000 } 
  end
  
