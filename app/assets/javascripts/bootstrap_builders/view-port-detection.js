$(document).ready(function() {
  sizes = {
    xs: [0, 767],
    sm: [768, 991],
    md: [992, 1199],
    lg: [1200, 999999]
  }

  $.bbViewPort = function() {
    width = window.innerWidth

    for(size in sizes) {
      size_width = sizes[size][0]
      size_height = sizes[size][1]

      if (width >= size_width && width < size_height) {
        return size
      }
    }

    throw "Could not figure out the Bootstrap view port from this width: " + width
  }

  $.bbViewPortOrAbove = function(given_size) {
    current_size = $.bbViewPort()
    reached = false

    for(size in sizes) {
      if (size == current_size) {
        reached = true
      }

      if (size == given_size) {
        if (reached) {
          return false
        } else {
          return true
        }
      }
    }

    throw "Invalid size: " + given_size
  }

  $.bbViewPortOrBelow = function(given_size) {
    current_size = $.bbViewPort()
    reached = false

    for(size in sizes) {
      if (size == current_size) {
        reached = true
      }

      if (given_size == size) {
        if (reached) {
          return true
        } else {
          return false
        }
      }
    }

    throw "Invalid size: " + given_size
  }

  viewport_callbacks = []
  $.bbViewPortChange = function(func) {
    viewport_callbacks.push(func)
  }

  resize_timeout = null
  current_viewport = $.bbViewPort()
  $.bbViewPortOnChanged = function() {
    if (resize_timeout) {
      clearTimeout(resize_timeout)
    }

    resize_timeout = setTimeout(function() {
      $("body").removeClass("bb-view-port-xs bb-view-port-sm bb-view-port-md bb-view-port-lg")
      new_viewport = $.bbViewPort()
      $("body").addClass("bb-view-port-" + new_viewport)

      if (new_viewport != current_viewport) {
        current_viewport = new_viewport

        for(number in viewport_callbacks) {
          viewport_callback = viewport_callbacks[number]
          viewport_callback.call()
        }
      }
    }, 200)
  }

  $(window).resize(function() {
    $.bbViewPortOnChanged()
  })

  $.bbViewPortOnChanged()
  document.addEventListener("turbolinks:load", function() {
    $.bbViewPortOnChanged()
  })
})
