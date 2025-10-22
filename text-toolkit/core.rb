module TextToolkit
  # Core TextToolkit

  def self.strip_special_chars(text)
    text.gsub(/[^a-zA-Z0-9\s]/, "")
  end

  def self.words_in_sentence(text)
    self.strip_special_chars(text).split
  end

  def self.word_count(text)
    self.strip_special_chars(text).split.length
  end

  def self.character_count(text)
    text.chars.length
  end

  def self.unique_words(text)
    unique_words = Set.new()
    self.words_in_sentence(text).each { |word| unique_words.add(word) }
    unique_words.to_a
  end

  def self.extract_emails(text)
    text.scan(/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/)
  end

  def self.extract_urls(text)
    text.scan(/\b(?:https?:\/\/|ftp:\/\/|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(?:\/[^\s]*)?\b/)
  end

  def self.extract(text, type)
    return text.scan(/#\w+(?:\.\w+)*/) if type == :hashtags
    return text.scan(/@\w+(?:\.\w+)*/) if type == :mentions
  end

  def self.contains_word?(text, word)
    self.words_in_sentence(text).include?(word)
  end

  def self.count_case(text, type)
    return text.scan(/[A-Z]/).length if type == :upper
    return text.scan(/[a-z]/).length if type == :lower
    return text.scan(/[0-9]/).length if type == :digit
  end

  def self.reverse_words(text)
    words_in_sentence(text).map { |word| word.reverse }
  end

end