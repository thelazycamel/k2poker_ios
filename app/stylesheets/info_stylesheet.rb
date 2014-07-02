class InfoStylesheet < ApplicationStylesheet

  def root_view(st)
    st.background_image = image.resource("info_background")
  end

  top = 40
  size = 35
  21.times do |line|
    define_method("score_#{line}") do |st|
      st.top = top
      st.left = 10
      st.width = 300
      st.height = size
      st.color = color.from_hex("53b2fc")
      st.text_alignment = :center
      st.font = rmq.font.with_name("Helvetica Neue", size)
    end
    top = top + size
    size = size - 1.5
  end

end
