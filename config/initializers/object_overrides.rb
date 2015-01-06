class String
  def to_underscore
    self.gsub(' ', '_').downcase
  end
end
