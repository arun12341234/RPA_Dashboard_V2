class Dashing.Login extends Dashing.Widget

  # ready: ->
    # This is fired when the widget is done being rendered
  ready: ->
    $('#login-form').on 'submit', (event) ->
      event.preventDefault()
      username = $('#username').val()
      password = $('#password').val()
      console.log(username)
      
      # document.getElementById('error-message').textContent = 'Invalid username or password!';

      # Clear any previous error messages
      # $('#error-message').text('')

      # Perform AJAX request for authentication
      $.ajax
        url: '/login'
        type: 'POST'
        contentType: 'application/json'
        data: JSON.stringify({ username: username, password: password })
        success: (response) ->
          console.log("jjjj",response)
          if response.success
            window.location.href = '/dashboard'
          else
            document.getElementById('error-message').style.display = 'block';
            console.log("jjjj",response)
            $('#error-message').text(response.error)
            setTimeout ->
              $('#error-message').fadeOut('slow'); # Hide the message after 5 seconds
            , 1000  # 5000 milliseconds = 5 seconds

  onData: (data) ->
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.