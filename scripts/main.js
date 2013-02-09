$(document).ready(function(){
	hideSubMenus();
	attachListeners();
	showCurrentMenu();
});

function attachListeners(){
	$('.navigation').each(function(){
		$(this).click(function(){
			//the clicked item would be the a inside the li, get the li to look for the next element
			/*var li = $(this).parent();
			var following = $(li).next();
			
			if($(following).is("ul")){
				$(following).show();
			};*/
			showSubmenu(this);
		});
	});
}

function showSubmenu(item){
	//the clicked item would be the a inside the li, get the li to look for the next element
	var li = $(item).parent();
	var following = $(li).next();
	var test =$(item).html();
	
	if($(item).is("a"));
	if($(following).is("ul")){
		$(following).show();
	}
}


function hideSubMenus(){
	$('.level-two-ul').hide();
	$('.level-three-ul').hide();
}

function showCurrentMenu(){
	/*showSubmenu($('.current'));
	var currentPage = window.location.pathname;
	var found = false;
	//iterate through the nexted menu items to see if one of them is current page
	$('.navigation.level-two-a').each(function(){
		var link = $(this).attr('href');
		if(link.indexOf(currentPage) != -1){
			//then this is the current page, show the whole list it exists in
			$(this).parent().show();
			found = true;
			
			//if it's got a sub menu show that too
			showSubmenu(this);
		}
	});
	
	if(!found){
		$('.navigation.level-three-a').each(function(){
		var link = $(this).attr('href');
		if(link.indexOf(currentPage) != -1){
			//then this is the current page, show the whole list it exists in
			$(this).parent().show();
			$(this).parent().parent().show();
		}
	});
	}*/
	$('.level-two-current').parent().show();
	$('.level-three-current').parent().show();
	$('.level-three-current').parent().parent().show();
	if($('.current').next().is("ul")){
		$('.current').next().show();
	}
	
	if($('.level-two-current').next().is("ul")){
		$('.level-two-current').next().show();
	}
	
}