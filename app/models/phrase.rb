class Phrase < ApplicationRecord
    # 必須項目のバリデーション
    # validates :content, presence: true
    # validates :music_title, presence: true
    # validates :comment, presence: true
    # validates :author_name, presence: true
    # validates :play_url, presence: true
    # validates :artist_name, presence: true
    
    
      validate :valid_youtube_id
    
      private
    
      def valid_youtube_id
        unless play_url =~ /\A[a-zA-Z0-9_-]{11}\z/
          errors.add(:play_url, "が正しいYouTubeのIDではありません")
        end
      end
    
  
    
    
    # # URLのフォーマット確認
    
  
    # # 長さの制限
    # validates :content, length: { maximum: 100 } 
    # validates :comment, length: { maximum: 1000 } 
  end
  
