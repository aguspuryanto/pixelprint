$(function(){
	var mycart_table = $("table#mycart_table").length;
    console.log ("mycart_table: " + mycart_table);
	$('#mycart_table tr').each(function() {
		console.log( $(this).find('td').text() );
	});
})(jQuery);