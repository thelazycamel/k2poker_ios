module Base
  class SettingsStylesheet < ApplicationStylesheet

    def root_view(st)
      st.background_color = color.from_hex("04487d")
    end

  end
end
