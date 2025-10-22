module TextToolkit
  module Cleaner
    def self.remove_special_chars(text)
      text.gsub(/[^a-zA-Z0-9\s]/, "")
    end
  end
end