require 'csv'
class Message < ApplicationRecord

  def self.phrase
    today = Time.new

    if today.monday?
       monday_music
    elsif today.tuesday?
       spanish_history
    elsif today.thursday?
       spanish_food
    elsif today.friday?
       friday_conjugation
    elsif today.saturday?
       saturday_phrases
    else
      "You do not have anything today, Josh! Go train BJJ"
    end
  end

  def self.monday_music
    @path = "phrases/music.csv"
    uploader
  end

  def self.spanish_history
    @path = "phrases/history.csv"
    uploader
  end

  def self.spanish_food
    @path = "phrases/food1.csv"
    uploader
  end

  def self.friday_conjugation
    @path = "phrases/conjugation.csv"
    uploader
  end

  def self.saturday_phrases
    @path = "phrases/phrases_updated.csv"
    uploader
  end

  private

  def self.uploader
    file = CSV.read(@path)
    file.flatten.sample
  end

end
