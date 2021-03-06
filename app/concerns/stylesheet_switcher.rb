module StylesheetSwitcher

  def stylesheet_for(controller)
    return stylesheet_constant("IpadRetina", controller) if is_ipad_retina?
    return stylesheet_constant("Ipad", controller) if is_ipad?
    return stylesheet_constant("SixPlus", controller) if is_six_plus?
    return stylesheet_constant("Six", controller) if is_six?
    return stylesheet_constant("Five", controller) if is_iphone_five?
    return stylesheet_constant("Base", controller)
  end

  def stylesheet_constant(device, controller)
    Kernel.const_get(device).const_get("#{controller}Stylesheet")
  end

  def is_ipad_retina?
    rmq.device.ipad? && rmq.device.retina?
  end

  def is_ipad?
    rmq.device.ipad?
  end

  def is_six_plus?
    rmq.device.five_point_five_inch?
  end

  def is_six?
    rmq.device.four_point_seven_inch?
  end

  def is_iphone_five?
    rmq.device.four_inch?
  end

end
