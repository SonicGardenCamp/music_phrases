class Phrase < ApplicationRecord
    
    validates :content, presence: true
    validates :music_title, presence: true
    validates :comment, presence: true
    validates :author_name, presence: true
    validates :play_url, presence: true
    validates :artist_name, presence: true
    
    @phrases = Phrase.order(created_at: :desc)

      
    def youtube_key
      key = play_url.match(%r[https://www.youtube.com/watch\?v=([_a-zA-Z0-9]*)])
      if key.present?
        key[1]
      end
    end
      private
    
    # 長さの制限
    validates :content, length: { maximum: 100 } 
    validates :comment, length: { maximum: 1000 } 
  end
  
