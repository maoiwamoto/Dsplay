# crop.coffee
$(document).on 'turbolinks:load', ->
  new ImageCrop()

class ImageCrop
  constructor: ->
    width = parseInt($('#cropbox').width())
    height = parseInt($('#cropbox').height())
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 120, 120]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#post_crop_x').val(coords.x)
    $('#post_crop_y').val(coords.y)
    $('#post_crop_w').val(coords.w)
    $('#post_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    rx = 120 / coords.w
    ry = 120 / coords.h

    $('#preview').css
        width: Math.round(rx * $('#cropbox').width()) + 'px'
        height: Math.round(ry * $('#cropbox').height()) + 'px'
        marginLeft: '-' + Math.round(rx * coords.x) + 'px'
        marginTop: '-' + Math.round(ry * coords.y) + 'px'