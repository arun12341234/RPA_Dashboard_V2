class Dashing.Table3 extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # Handle incoming data
    # console.log('t3 data received:', data)
    # console.log('t3 header data received:', data.pages[0])
    # console.log($('#table3data'))
    selector7 = "[id='tridvalue']"
    thdElements = $(selector7)
    thdElements.each (index, element) ->
      $(element).text((index+1))
      # console.log("ok",index, $(element).text((index+1)))
      
      # console.log('t3 header data received:',(index + 1), data.pages[0]["col"+(index + 1)])
    selector8 = "[id='trvalue']"
    thdElements = $(selector8)
    thdElements.each (index, element) ->
      $(element).text(data.pages[0]["col"+(index + 1)])
      # console.log("ok",index, $(element).text(data.pages[0]["col"+(index + 1)]))
          
    selector9 = "[id='table3data']"
    thdElements = $(selector9) 

    thdElements.each (index, element) ->
      # Get the length of the value for the current header
      valueLength = data.table_headers[index].value.length

      # Log the index and value length
      console.log("woe", index, valueLength)
      # Base width for length of 1
      baseWidth = 100
      # Scaling factor for each additional character
      scalingFactor = 11
      
      width = baseWidth + (valueLength - 1) * scalingFactor
      $(element).css("width", "#{width}px")
      # # Set the width based on the value length
      # if 0 < valueLength < 10
      #   $(element).css("width", "200px")
      # else if 10 < valueLength < 20
      #   $(element).css("width", "250px")  # Adjust width as needed
      # else if 20 < valueLength < 30
      #   $(element).css("width", "400px")
      # else if 30 < valueLength < 40
      #   $(element).css("width", "350px")  # Adjust width as needed






    
























    
    selector7 = "[id='dynamicText']"
    thdElements = $(selector7)

    thdElements.each (index, element) ->
          console.log(
            element
          )
          wrapText(element, 100)
    #     dynamicText = "Your long dynamic text that may need to wrap for element #{index + 1}" # Sample text
    #     words = dynamicText.split(" ")
    #     currentLine = ""
    #     maxWidth = 100 # Example max width
    #     tspanElements = []
    #     console.log(
    #       words,$(element).css
    #     )
    #     $(element).css "background-color", "red"

        # for word in words
        #     testLine = currentLine + word + " "
        #     testText = document.createElementNS("http://www.w3.org/2000/svg", "text")
        #     testText.setAttribute("font-size", "12")
        #     testText.textContent = testLine

        #     # Check if the current line exceeds the max width
        #     if testText.getBBox().width > maxWidth and currentLine
        #         # Push the current line to tspan and start a new one
        #         tspanElements.push "<tspan x='23' dy='1.2em'>#{currentLine.trim()}</tspan>"
        #         currentLine = word + " "
        #     else
        #         currentLine = testLine

        # # Add the last line if any text remains
        # if currentLine
        #     tspanElements.push "<tspan x='23' dy='1.2em'>#{currentLine.trim()}</tspan>"

        # # Clear existing text and insert new tspan elements
        # $(element).empty().append(tspanElements.join(""))

    
    
      # trvalue
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.