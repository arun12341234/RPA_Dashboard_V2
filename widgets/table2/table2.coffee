class Dashing.Table2 extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    console.log(data.table_headers.length,"dataaaaaaaaaaaaaaaaa")
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.

    selector7 = 'tbody tr'
    thdElements = $(selector7)
    thdElements.each (index, element) ->
      # console.log(element,index)
      # console.log($(element))
      columns = $(element).find('td');
      console.log(columns)
      columns.each (index1, element1) ->
        console.log(element1,index1)
        if index1 >= data.table_headers.length
          $(element1).remove()


      # $(element).text((index+1))
      # if $(element).text().trim() == ''
      #     console.log "Empty <th> tag found at index #{index}, removing it."
          
      #     # Remove the empty <th> element
      #     $(element).remove()






    