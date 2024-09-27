class Dashing.RpaWig extends Dashing.Widget
  @accessor 'current', Dashing.AnimatedValue
  # @accessor 'comp_record', Dashing.AnimatedValue
  # @accessor 'difference', ->
  #   console.log("Calculating difference...")
  #   totalProcessed = @get('total_records_processed')
  #   totalFailed = @get('total_failed_records')
  #   if totalProcessed and totalFailed
  #     diff = Math.abs(Math.round((totalFailed - totalProcessed) / totalProcessed * 100))
  #     "#{diff}%"
  #   else
  #     "100%"


  onData: (data) ->
    # var lastUpdated = widgetData.last_updated;
    # console.log('New data lastUpdated:', lastUpdated)

    console.log('now data received:', data)
    if data.status
      # clear existing "status-*" classes
      $(@get('node')).attr 'class', (i,c) ->
        c.replace /\bstatus-\S+/g, ''
      # add new class
      $(@get('node')).addClass "status-#{data.status}"

    @updateColor(data)
    
    

    
  redirect: (data) ->
    # console.log('New data received2:', data.getAttribute('data-id'))
    bot_index = data.getAttribute('data-id').split("rpa_lect")[1]
    if data? and data.innerText.trim() isnt ""
        link_data = data.innerText.split("\n")[0].split(" ")[1]
        # console.log(link_data)
        
        location.href = 'execution_data?bot_name=' + encodeURIComponent(link_data) + '&bot_index=' + encodeURIComponent(bot_index)
        # location.href = 'execution_data'
    else
        console.log("not exist")
    
  updateColor: (data) ->
    # console.log("okkkkk")
    selector = "h4[class='more-info']"
    rpaElements = $(selector)
    rpaElements.each (index, element) ->
      # console.log('Old data received:',
      # element.innerText.split(" ");
      # )

      dateParts = element.innerText.split(" ");
      # console.log('Old data received:',
      # dateParts[0]
      # )
      selector = "[id='date']"
      rpaElements = $(selector)
      rpaElements.each (index, element) ->
        # console.log("here",
        #       element.innerText
        #     )
        $(element).text(dateParts[0])
      selector = "[id='time']"
      rpaElements = $(selector)
      rpaElements.each (index, element) ->
        # console.log("here",
        #       element.innerText
        #     )
        $(element).text(dateParts[1])
      selector = "[id='timezone']"
      rpaElements = $(selector)
      rpaElements.each (index, element) ->
        # console.log("here",
        #       element.innerText
        #     )
        $(element).text(dateParts[2])


    # console.log('New data received:',data, data.color_rules)
    selector = "div[data-id='" + data.dataid + "'] div"
    rpaElements = $(selector)
    rpaElements.each (index, element) ->
      

      current = data.current
      if data.color_rules.rule_1_min <= current <= cata.color_rules.rule_1_max
        $(element).css "background-color", data.color_rules.tail_bg_color_0_25
        $(element).css "color", data.color_rules.tail_bg_color_75_100
      else if data.color_rules.rule_2_min <= current <= cata.color_rules.rule_2_max
        $(element).css "background-color", data.color_rules.tail_bg_color_25_50
      else if data.color_rules.rule_3_min <= current <= cata.color_rules.rule_3_max
        $(element).css "background-color", data.color_rules.tail_bg_color_50_75
      else if data.color_rules.rule_4_min <= current <= cata.color_rules.rule_4_max
        $(element).css "background-color", data.color_rules.tail_bg_color_75_100
        $(element).css "color", data.color_rules.tail_bg_color_75_100
    selector1 = "div[data-id='" + data.dataid + "'] div span"
    h1Elements = $(selector1)
    h1Elements.each (index, element) ->
      # console.log(element,data.current,"HAAAAA")


      current = data.current
      if data.color_rules.rule_1_min <= current <= cata.color_rules.rule_1_max
        $(element).css "color", data.color_rules.tail_fg_color_0_25
      else if data.color_rules.rule_2_min <= current <= cata.color_rules.rule_2_max
        $(element).css "color", data.color_rules.tail_fg_color_25_50
      else if data.color_rules.rule_3_min <= current <= cata.color_rules.rule_3_max
        $(element).css "color", data.color_rules.tail_fg_color_50_75
      else if data.color_rules.rule_4_min <= current <= cata.color_rules.rule_4_max
        $(element).css "color", data.color_rules.tail_fg_color_75_100
    selector1 = "div[data-id='" + data.dataid + "'] div p"
    h1Elements = $(selector1)
    h1Elements.each (index, element) ->
      # console.log(element,data.current,"HAAAAA")


      current = data.current
      if data.color_rules.rule_1_min <= current <= data.color_rules.rule_1_max
        $(element).css "color", data.color_rules.tail_fg_color_0_25
      else if data.color_rules.rule_2_min <= current <= data.color_rules.rule_2_max
        $(element).css "color", data.color_rules.tail_fg_color_25_50
      else if data.color_rules.rule_3_min <= current <= data.color_rules.rule_3_max
        $(element).css "color", data.color_rules.tail_fg_color_50_75
      else if data.color_rules.rule_4_min <= current <= data.color_rules.rule_4_max
        $(element).css "color", data.color_rules.tail_fg_color_75_100








    selector2 = "div[data-id='" + data.dataid + "'] h4"
    h4Elements = $(selector2)
    h4Elements.each (index, element) ->


      current = data.current
      if data.color_rules.rule_1_min <= current <= data.color_rules.rule_1_max
        $(element).css "color", data.color_rules.tail_fg_color_0_25
      else if data.color_rules.rule_2_min <= current <= data.color_rules.rule_2_max
        $(element).css "color", data.color_rules.tail_fg_color_25_50
      else if data.color_rules.rule_3_min <= current <= data.color_rules.rule_3_max
        $(element).css "color", data.color_rules.tail_fg_color_50_75
      else if data.color_rules.rule_4_min <= current <= data.color_rules.rule_4_max
        $(element).css "color", data.color_rules.tail_fg_color_75_100
  
    selector3 = "div[data-id='" + data.dataid + "'] h4 span"
    h4sElements = $(selector3)
    h4sElements.each (index, element) ->


      current = data.current
      if data.color_rules.rule_1_min <= current <= data.color_rules.rule_1_max
        $(element).css "color", data.color_rules.tail_fg_color_0_25
      else if data.color_rules.rule_2_min <= current <= data.color_rules.rule_2_max
        $(element).css "color", data.color_rules.tail_fg_color_25_50
      else if data.color_rules.rule_3_min <= current <= data.color_rules.rule_3_max
        $(element).css "color", data.color_rules.tail_fg_color_50_75
      else if data.color_rules.rule_4_min <= current <= data.color_rules.rule_4_max
        $(element).css "color", data.color_rules.tail_fg_color_75_100


    selector4 = "div[data-id='" + data.dataid + "'] text"
    sElements = $(selector4)
    sElements.each (index, element) ->
      console.log("svg now")


      current = data.current
      textElement = $(element).find('text#time')  # Assuming you want to target the specific <text> element

      if data.color_rules.rule_1_min <= current <= data.color_rules.rule_1_max
        textElement.attr "fill", data.color_rules.tail_fg_color_0_25
      else if data.color_rules.rule_2_min <= current <= data.color_rules.rule_2_max
        textElement.attr "fill", data.color_rules.tail_fg_color_25_50
      else if data.color_rules.rule_3_min <= current <= data.color_rules.rule_3_max
        textElement.attr "fill", data.color_rules.tail_fg_color_50_75
      else if data.color_rules.rule_4_min <= current <= data.color_rules.rule_4_max
        textElement.attr "fill", data.color_rules.tail_fg_color_75_100
          # if data.color_rules.rule_1_min <= current <= cata.color_rules.rule_1_max
      #   $(element).css "color", data.color_rules.tail_fg_color_0_25
      # else if data.color_rules.rule_2_min <= current <= cata.color_rules.rule_2_max
      #   $(element).css "color", data.color_rules.tail_fg_color_25_50
      # else if data.color_rules.rule_3_min <= current <= cata.color_rules.rule_3_max
      #   $(element).css "color", data.color_rules.tail_fg_color_50_75
      # else if data.color_rules.rule_4_min <= current <= cata.color_rules.rule_4_max
      #   $(element).css "color", data.color_rules.tail_fg_color_75_100

    