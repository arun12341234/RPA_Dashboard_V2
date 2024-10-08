class Dashing.UpdateColorValue extends Dashing.Widget

  ready: ->
    # This is fired when the widget is done being rendered

  onData: (data) ->
    # console.log("UpdateColorValue", data)
    $('#title-bg-color').val(data.title_bg_color);
    $('#title-fg-color').val(data.title_fg_color);

    $('#tail-bg-color-0-25').val(data.tail_bg_color_0_25);
    $('#tail-bg-color-25-50').val(data.tail_bg_color_25_50);
    $('#tail-bg-color-50-75').val(data.tail_bg_color_50_75);
    $('#tail-bg-color-75-100').val(data.tail_bg_color_75_100);
    $('#tail-fg-color-0-25').val(data.tail_fg_color_0_25);
    $('#tail-fg-color-25-50').val(data.tail_fg_color_25_50);
    $('#tail-fg-color-50-75').val(data.tail_fg_color_50_75);
    $('#tail-fg-color-75-100').val(data.tail_fg_color_75_100);

    $('#header-bg-color').val(data.header_bg_color);
    $('#header-fg-color').val(data.header_fg_color);
    $('#page-bg-color').val(data.page_bg_color);
    $('#page-fg-color').val(data.page_fg_color);

    $('#rule-1-min').val(data.rule_1_min);
    $('#rule-1-max').val(data.rule_1_max);
    $('#rule-2-min').val(data.rule_2_min);
    $('#rule-2-max').val(data.rule_2_max);
    $('#rule-3-min').val(data.rule_3_min);
    $('#rule-3-max').val(data.rule_3_max);
    $('#rule-4-min').val(data.rule_4_min);
    $('#rule-4-max').val(data.rule_4_max);
    
    # Handle incoming data
    # You can access the html node of this widget with `@node`
    # Example: $(@node).fadeOut().fadeIn() will make the node flash each time data comes in.


    selector5 = "[data-id='title_header']"
    console.log("ok",selector5)
    thElements = $(selector5)
    thElements.each (index, element) ->
      console.log("ok",element)


      $(element).css "background-color", data.title_bg_color
    selector6 = "table[data-id='title_header'] div"
    thdElements = $(selector6)
    thdElements.each (index, element) ->


      $(element).css "background-color", data.title_bg_color
      $(element).css "color", data.title_fg_color

    selector7 = "[data-id='title_header'] div h5"
    thdElements = $(selector7)
    thdElements.each (index, element) ->
      console.log("ok",element)


      $(element).css "color", data.title_fg_color

    selector8 = "[data-id='title_header_fg']"
    tdhElements = $(selector8)
    tdhElements.each (index, element) ->


      $(element).css "color", data.title_fg_color
    selector9 = "table[data-id='table3header']"
    tdhhElements = $(selector9)
    tdhhElements.each (index, element) ->


      $(element).css "background-color", data.header_bg_color
      $(element).css "color", data.header_fg_color
    selector10 = "table[data-id='table2page']"
    tdhhElements = $(selector10)
    tdhhElements.each (index, element) ->


      $(element).css "background-color", data.page_bg_color
      $(element).css "color", data.page_fg_color

      # $(element).css "background-color", data.page_bg_color
      # $(element).css "color", data.page_fg_color



    # selector2 = "div[data-id='" + data.dataid + "'] h4"
    # h4Elements = $(selector2)
    # h4Elements.each (index, element) ->
    # i want Dashing.AnimatedValue also
    selector12 = "[id='preview-value']"
    tdhhElements = $(selector12)
    tdhhElements.each (index, element) ->
      console.log("preview",)


      current = $(element).text().split("%")[0]
      console.log(data)
    
      selector11 = "[id='preview']"
      tdhhElements = $(selector11)
      tdhhElements.each (index, element1) ->
        console.log("preview",element1)

        if data.rule_1_min <= current <= data.rule_1_max
          $(element).css "color", data.tail_fg_color_0_25
          $(element).css "background-color", data.tail_bg_color_0_25
          $(element1).css "color", data.tail_fg_color_0_25
          $(element1).css "background-color", data.tail_bg_color_0_25
        else if data.rule_2_min <= current <= data.rule_2_max
          $(element).css "color", data.tail_fg_color_25_50
          $(element).css "background-color", data.tail_bg_color_25_50
          $(element1).css "color", data.tail_fg_color_25_50
          $(element1).css "background-color", data.tail_bg_color_25_50

        else if data.rule_3_min <= current <= data.rule_3_max
          $(element).css "color", data.tail_fg_color_50_75
          $(element).css "background-color", data.tail_bg_color_50_75
          $(element1).css "color", data.tail_fg_color_50_75
          $(element1).css "background-color", data.tail_bg_color_50_75

        else if data.rule_4_min <= current <= data.rule_4_max
          $(element).css "color", data.tail_fg_color_75_100
          $(element).css "background-color", data.tail_bg_color_75_100
          $(element1).css "color", data.tail_fg_color_75_100
          $(element1).css "background-color", data.tail_bg_color_75_100

  