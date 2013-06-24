class Comment < ActiveRecord::Base
  attr_accessible :content, :mix_id, :time, :user_id
  belongs_to :mix
  belongs_to :user
  has_many :replies, :dependent => :destroy
  include Formattable

  def convert_time
    min = (time / 60).floor
    sec = "%02d" % (time % 60)
    "#{min}:#{sec}"
  end

end
