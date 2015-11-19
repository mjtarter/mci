function showDiv(id){
	document.getElementById(id).style.display = "inline-block";
}

function showDivBlock(id){
	document.getElementById(id).style.display = "block";
}

function hideDiv(id){
	document.getElementById(id).style.display = "none";
}

// Toggle Search Bar for Google Map

function toggle() {
	
	if (document.getElementById('search-bar').style.display == 'block') {
    	document.getElementById('search-bar').style.display = "none";
		document.getElementById('toggle-text').innerHTML = '<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span> Refine Search';
	} else {
    	document.getElementById('search-bar').style.display = "block";
		document.getElementById('toggle-text').innerHTML = '<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span> Hide Search Bar';
	}
}