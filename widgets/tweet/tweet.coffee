class Dashing.Tweet extends Dashing.Widget
  @accessor 'tweet', Dashing.AnimatedValue

  @accessor 'avatar', ->
    image_url = @get('avatar_image')
    $(@node).find(".avatar-image").attr('src', image_url)

  @accessor 'date', ->
    date =  new Date(@get('created_at'))
    month = date.getUTCMonth()
    day = date.getUTCDate()
    day + "." + month 