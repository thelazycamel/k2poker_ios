class InfoStylesheet < ApplicationStylesheet

  def root_view(st)
    st.background_image = image.resource("info_background")
  end

  top = 40
  size = 40
  21.times do |line|
    define_method("score_#{line}") do |st|
      st.top = top
      st.left = 10
      st.width = 300
      st.height = size
      st.color = color.white
      st.text_alignment = :center
      st.font = rmq.font.with_name("Helvetica Neue", size)
    end
    top = top + size
    size = size - 1.8
  end

end
