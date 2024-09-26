class Dashing.PaginationBottom extends Dashing.Widget
  # Initialize the currentPage as an instance variable
  currentPage: 1  # Track the current page

  ready: ->
    @getData()

  getData: ->
    @get 'pagination', (data) =>
      @onData(data)

  onData: (data) ->
    @renderPagination(data)

  renderPagination: (data) ->
    console.log("hi page data",data)

    # Filter and prepare keys
    arKeys = Object.keys(data).filter((key) ->
      key != "id" and key != "updatedAt"
    ).map((key) ->
      { value: data[key], text: key }
    )

    totalItems = arKeys.length
    itemsPerPage = 15
    totalPages = Math.ceil(totalItems / itemsPerPage)

    # Update the total pages display
    $('#my-widget1').text(totalPages)

    # Update current page display
    $('#current-page').text(@currentPage)
    # console.log(
    #   "hello",$('.next-page').attr('onclick', "location.href='/rpa0#{@currentPage + 1}';")
    # )
    
    # $('.next-page').attr('href', "/rpa0#{@currentPage + 1}")
    # Handle the Previous button
    currentUrl = window.location.href;
    console.log(currentUrl.split('/')[3]);
    specificPart = currentUrl.split('/')[3]
    if (specificPart.includes("rpa0"))
      console.log("The substring 'rpa0' is present in the URL part.");
      numberPart = specificPart.split("rpa0")[1];
      console.log(
        numberPart
      )
      initige = parseInt(numberPart, 10);
      console.log(
        "initige",initige
      )
      if initige>1
        $('.prev-page').attr('onclick', "location.href='/rpa0#{initige-1}';")
      if initige <= totalPages
        $('.next-page').attr('onclick', "location.href='/rpa0#{initige+1}';")
    else 
      console.log("The substring 'rpa0' is not present in the URL part.");
    







#   ready: ->
#     @getData()

#   getData: ->
#     @get 'pagination', (data) =>
#       @onData(data)

#   onData: (data) ->
#     @renderPagination(data)

#   renderPagination: (data) ->
#     console.log(data)
#     arKeys = Object.keys(data).filter((key) ->
#       key != "id" and key != "updatedAt"
#     ).map((key) ->
#       { value: data[key], text: key }
#     )
#     console.log(arKeys)
#     # arKeys = Object.keys(data).filter((key) -> key.startsWith('AR'))
#     totalItems = arKeys.length
#     itemsPerPage = 15
#     totalPages = Math.ceil(totalItems / itemsPerPage)
#     maxButtons = Math.min(totalPages, 9)
#     console.log("maxButtons",maxButtons)
#     $('#my-widget1').html(maxButtons)

#     paginationContainer = $('#pagination-1-container')
#     paginationContainer.empty()
#     if maxButtons
#       for i in [1..maxButtons]
#         console.log(i)
#         li = $("<li class='pagination-li'>").text(i)
#         li.on 'click', ((pageNum) -> () ->
#           window.location.href = "rpa0#{pageNum}"
#         )(i)
#         paginationContainer.append(li)

# # Assuming you have additional setup code for Dashing.Widget and @get method handling elsewhere
