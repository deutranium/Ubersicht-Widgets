stylingOptions =
  # background color
  background: 'rgba(#fff, 0)' 
  # show fullscreen -> true
  fullscreen: false
  # display position 'top', 'middle', 'bottom'
  vertical: 'bottom'
  horizontal: 'right'

dateOptions =
  # display not only 'time' also 'date'
  showDate: true
  # format of 'date'
  date: '%d/%m/%Y %a'

format = (->
  if dateOptions.showDate
    dateOptions.date + '\n' +'%l:%M:%S %p'
  else
    '%l:%M:%S %p'
)()

command: "date +\"#{format}\""

# the refresh frequency in milliseconds
refreshFrequency: 10

# for update function
dateOptions: dateOptions

render: (output) -> """
  <div id='simpleClock'>#{output}</div>
"""

update: (output) ->
  if this.dateOptions.showDate
    data = output.split('\n')

    html = data[1]
    html += '<span class="date">'
    html += data[0]
    html += '</span>'
    
  else
    html = output

  $(simpleClock).html(html)

style: (->
  fontSize = '7em'
  width = 'auto'
  transform = 'auto'
  bottom = '3%'
  top = 'auto'

  if stylingOptions.fullscreen
    fontSize = '10em'
    width = '94%'

  if stylingOptions.vertical is 'middle'
    transform = 'translateY(50%)'
    bottom = '50%'
  else if stylingOptions.vertical is 'top'
    bottom = 'auto'
    top = '3%'

  return """
    background: #{stylingOptions.background}
    color: #aaa
    font-family: Helvetica Neue
    left: 3%
    top: #{top}
    bottom: #{bottom}
    transform: #{transform}
    width: #{width}

    #simpleClock
      font-size: #{fontSize}
      font-weight: 100
      margin: 0
      text-align: center
      padding: 10px 20px

    #simpleClock .date
      margin-left: .5em
      font-size: .5em
  """
)()
