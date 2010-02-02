module Stars::ActiveRecordExtension
  def is_rateable
    include ::Stars::Rateable
  end
end
