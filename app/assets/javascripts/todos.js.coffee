# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->

	remove = (id) ->
		$('.editor').hide()
		$.get 'done?id='+id, ->
		    $('#'+id).attr('class','animated lightSpeedOut ')
		    setTimeout (-> $('#'+id).remove()), 500

	edit = (id) ->
		$('.editor').load 'editor?id='+id, ->
			$('.exit').click ->	
				$('.editor').hide()		
		$('.editor').show()

	initGesture = (e) ->
		$(e).dblclick ->
				remove($(this).attr('id'))
				true
		 	
		#$(e).click ->
		#		edit($(this).attr('id'))
		#		true
	
	addTopic = (data, newItem = false) ->
		li = $('<li>').text(data.name).attr('id',data.id)
		li.attr('class', 'animated bounceInDown') if newItem 
		$("ul.topics").append li
		initGesture li

	loadList = (name) ->
		$('.topics li').remove()
		$.getJSON 'list?name='+name,
		(data) -> 
			addTopic(item) for item in data

	$('form.search ').submit (e)->
		e.preventDefault() 

	$('form.search .query').keydown ->
		loadList $(this).val()

	$('form.search .query').keyup ->
		loadList $(this).val()

	$('form.addTopic').submit (e)->
		e.preventDefault() 
		$.getJSON 'add?q='+$(".query").val(),
		(data) -> 
			addTopic(data, true)
			$(".query").val("")
			
	$('.editor form').submit (e)->
		e.preventDefault() 
		$.getJSON 'edit?name='+$(".name").val()+'&date='+$(".date").val()+'&time='+$(".time").val()+'&id='+$(".id").val(),
		(data) -> 
			$('#'+data.id).text(data.name)
			$('.editor').hide()

	
	loadList ''

	$('.entypo-plus').click ->
		$('.search').attr('class','search animated bounceOutUp')
		$('.addTopic').show().attr('class','addTopic animated bounceInDown') 



	$('.entypo-search').click ->
		$('.addTopic').attr('class','addTopic animated bounceOutUp')
		$('.search').show().attr('class',' search animated bounceInDown') 





 


	

