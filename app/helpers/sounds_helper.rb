module SoundsHelper

  def win_sound
    file_name = "chipsHandle#{Random.rand(3) + 1}.wav"
    play_sound(file_name)
  end

  def applause_sound
    play_sound("applause.mp3")
  end

  def lose_sound
    play_sound("cardFan.wav")
  end

  def fold_sound
    play_sound("fold.wav")
  end

  def card_deal_sound
    file_name = "cardSlide#{Random.rand(5) + 1}.wav"
    play_sound(file_name)
  end

  def play_sound(file_name)
    return if @game.sounds == false
    name, ext = file_name.split(".")
    path = NSBundle.mainBundle.pathForResource(name, ofType: ext)
    sound_id = Pointer.new('I')
    AudioServicesCreateSystemSoundID(NSURL.fileURLWithPath(path), sound_id)
    AudioServicesPlaySystemSound(sound_id[0])
  end

end
