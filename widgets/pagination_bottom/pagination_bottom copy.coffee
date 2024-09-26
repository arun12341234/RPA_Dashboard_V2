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
    console.log("here",data)

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
    console.log(
      "hello",$('.next-page').attr('onclick', "location.href='/rpa0#{@currentPage + 1}';")
    )
    
    # $('.next-page').attr('href', "/rpa0#{@currentPage + 1}")
    # Handle the Previous button
    $('.prev-page').off('click').on 'click', (e) ->
      e.preventDefault()  # Prevent default link behavior
      if @currentPage > 1
        @currentPage -= 1
        $('#current-page').text(@currentPage)  # Update current page display
        @fetchPageData(@currentPage)  # Fetch data for the previous page
        # Update the href attribute for the previous page link

        $('.prev-page').attr('onclick', "location.href='/rpa0#{@currentPage - 1}';")
        # $('.next-page').attr('onclick', "location.href='/rpa0#{@currentPage + 1}';")

    # Handle the Next button
    $('.next-page').off('click').on 'click', (e) ->
      e.preventDefault()  # Prevent default link behavior
      if @currentPage < totalPages
        @currentPage += 1
        $('#current-page').text(@currentPage)  # Update current page display
        @fetchPageData(@currentPage)  # Fetch data for the next page
        # Update the href attribute for the next page link
        console.log("jjjjjjjjjjjj",
          $('.prev-page').attr('href', "#page=#{@currentPage - 1}")
        )
        $('.next-page').attr('onclick', "location.href='/rpa0#{@currentPage + 1}';")

  fetchPageData: (pageNum) ->
    # Simulating an API call or data retrieval for the current page
    console.log("Fetching data for page: #{pageNum}")

    # Here, you would replace this with your actual data fetching logic
    @get "pagination/rpa0#{pageNum}", (data) =>
      @onData(data)  # Call onData with the retrieved data



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
