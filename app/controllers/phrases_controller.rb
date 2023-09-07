class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[ show edit update destroy ]

  def index
    @phrases = Phrase.order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
  end

  def new
    @phrase = Phrase.new
    @phrases = Phrase.all # すべてのフレーズを取得
  end

  def edit
  end

  def create
    @phrase = Phrase.new(phrase_params)
    url = params[:phrase][:play_url]
    @phrase.play_url = url.last(11)

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to phrase_url(@phrase), notice: "フレーズを正常に登録しました。" }
        format.json { render :show, status: :created, location: @phrase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @phrase.update(phrase_params)
        
        # 更新したフレーズの前にあるフレーズの数をカウント
        previous_phrases_count = Phrase.where('id < ?', @phrase.id).count
        # ページ数を計算
        page_number = (previous_phrases_count.to_f / 12.0).ceil

        format.html { redirect_to phrases_path(page: page_number), notice: "フレーズを正常に更新しました。" }
        format.json { render :show, status: :ok, location: @phrase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
end


  def destroy
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to phrases_url, notice: "フレーズを正常に削除しました。" }
      format.json { head :no_content }
    end
  end

  private
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    def phrase_params
      params.require(:phrase).permit(:content, :music_title, :comment, :author_name, :play_url, :artist_name)
    end
end
