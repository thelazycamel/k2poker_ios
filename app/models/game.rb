class Game

  PROPERTIES = [:score, :open, :rebuys, :rebuy_obtained, :million_rebuy, :high_score, :table_cards, :deck, :game_status, :player_1_status, :player_1_card_1, :player_1_card_2, :player_2_status, :player_2_card_1, :player_2_card_2]

  PROPERTIES.each do |prop|
    attr_accessor prop
  end

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value)
      end
    end
  end

  def initWithCoder(decoder)
    self.init
    PROPERTIES.each do |prop|
      saved_value = decoder.decodeObjectForKey(prop.to_s)
      self.send("#{prop}=", saved_value)
    end
    self
  end

  def encodeWithCoder(encoder)
    PROPERTIES.each do |prop|
      encoder.encodeObject(self.send(prop), forKey: prop.to_s)
    end
  end

  def save
    defaults = NSUserDefaults.standardUserDefaults
    defaults["game"] = NSKeyedArchiver.archivedDataWithRootObject(self)
  end

  def self.load
    defaults = NSUserDefaults.standardUserDefaults
    data = defaults["game"]
    # protect against nil case
    NSKeyedUnarchiver.unarchiveObjectWithData(data) if data
  end

end
