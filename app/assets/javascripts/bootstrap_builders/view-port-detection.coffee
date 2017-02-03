$ ->
  sizes = {
    xs: [0, 767],
    sm: [768, 991],
    md: [992, 1199],
    lg: [1200, 999999]
  }

  $.bbViewPort = ->
    width = window.innerWidth

    for size of sizes
      size_width = sizes[size][0]
      size_height = sizes[size][1]
      return size if width >= size_width && width <= size_height

    throw "Could not figure out the Bootstrap view port from this width: " + width

  $.bbViewPortOrAbove = (given_size) ->
    current_size = $.bbViewPort()
    reached = false

    for size of sizes
      reached = true if size == current_size

      if size == given_size
        if reached
          return false
        else
          return true

    throw "Invalid size: " + given_size

  $.bbViewPortOrBelow = (given_size) ->
    current_size = $.bbViewPort()
    reached = false

    for size of sizes
      reached = true if size == current_size

      if given_size == size
        if reached
          return true
        else
          return false

    throw "Invalid size: " + given_size

  viewport_callbacks = []
  $.bbViewPortChange = (func) -> viewport_callbacks.push(func)

  resize_timeout = null
  current_viewport = $.bbViewPort()
  $.bbViewPortOnChanged = ->
    clearTimeout(resize_timeout) if resize_timeout

    resize_timeout = setTimeout( ->
      $("body").removeClass("bb-view-port-xs bb-view-port-sm bb-view-port-md bb-view-port-lg")
      new_viewport = $.bbViewPort()
      $("body").addClass("bb-view-port-" + new_viewport)

      if new_viewport != current_viewport
        current_viewport = new_viewport

        for number, viewport_callback of viewport_callbacks
          viewport_callback.call()
    , 200)

  $(window).resize -> $.bbViewPortOnChanged()
  $.bbViewPortOnChanged()
  document.addEventListener "turbolinks:load", -> $.bbViewPortOnChanged()
