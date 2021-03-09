// Menu (secondary options vertical) Hover
$('.homeactions').mouseenter(function() {
	$('.homeactions_items').show();
});

$('.homeactions').mouseleave(function() {
	$('.homeactions_items').hide();
});

$('.homeactions_items').mouseenter(function() {
	$('.homeactions_items').show();
});

$('.homeactions_items').mouseleave(function() {
	$('.homeactions_items').hide();
});


// Menu (add items button) 
$('#addWidgetDropDown_btn').click( function() {
	$('#addWidgetDropDown_').toggle();
}); 

$('#addWidgetDropDown_').mouseenter(function() {
	$('#addWidgetDropDown_').show();
});
$('#addWidgetDropDown_').mouseleave(function() {
	$('#addWidgetDropDown_').hide();
});

// Change Layout - Open modal 
$('#changeLayoutDivBtn').on('click',function(){
	$('#changeLayoutDivHome').addClass('slds-fade-in-open');
	if ($('#changeLayoutDivHome').hasClass('slds-fade-in-open')){
		$('.slds-backdrop_open.overlay').show();
	} else {
		$('.slds-backdrop_open.overlay').hide();
	}
});

// Add widgets modal - Open modal 
$('#addWidgetsDiv_').on('click',function(){
	$('#addWidgetsDiv_').addClass('slds-fade-in-open');
	if ($('#addWidgetsDiv_').hasClass('slds-fade-in-open')){
		$('.slds-backdrop_open.overlay').show();
	} else {
		$('.slds-backdrop_open.overlay').hide();
	}
});

$('#addmodule').on('click',function(){
	$('.slds-backdrop_open.overlay').show();
});

// Change Layout - Close modal 
var modal = document.getElementById("changeLayoutDivHome");

window.onclick = function(event) {
	if (event.target == modal) {
		modal.classList.remove('slds-fade-in-open');
		$('.slds-backdrop_open.overlay').hide();
	}
}

function closeLayoutModal() {
	$('.slds-backdrop_open.overlay').hide();
	$('#changeLayoutDivHome').removeClass('slds-fade-in-open');
}
$('.layoutModalCancel').on('click',function(){
	closeLayoutModal();
});

function closeOverlay() {
	$('.slds-backdrop_open.overlay').hide();
}

document.addEventListener('keydown', function(event){
	if(event.key === "Escape"){
		closeLayoutModal();
	}
});

// Resizing widgets
$('.layoutModalCancel').on('click',function(){
	closeLayoutModal();
});

$('#1-column-layout').click( function() {
	$('.widget_grid').attr('class', function(_i, c){
		return c.replace(/(^|\s)slds-size_\S+/g, ' slds-size_1-of-1');
	});
});

$('#2-column-layout').click( function() {
	$('.widget_grid').attr('class', function(_i, c){
		return c.replace(/(^|\s)slds-size_\S+/g, ' slds-size_1-of-2');
	});
});

$('#3-column-layout').click( function() {
	$('.widget_grid').attr('class', function(_i, c){
		return c.replace(/(^|\s)slds-size_\S+/g, ' slds-size_1-of-3');
	});
});

$('#4-column-layout').click( function() {
	$('.widget_grid').attr('class', function(_i, c){
		return c.replace(/(^|\s)slds-size_\S+/g, ' slds-size_1-of-4');
	});
});

//Expand Options menu
function expandGrid(id){
	$(`#gridOption${id}`).toggle();
}

function hideExpandGrid() {
	$('.expand_gridoptions').hide();
}
