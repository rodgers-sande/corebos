{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
 ********************************************************************************/
-->*}
<link rel="stylesheet" type="text/css" media="all" href="include/chart.js/Chart.min.css">
<script type="text/javascript" src="modules/Home/Homestuff.js"></script>
<script type="text/javascript" src="include/js/notebook.js"></script>
<script type="text/javascript" src="include/freetag/tagcanvas.min.js"></script>
<script src="include/chart.js/Chart.min.js"></script>
<script src="include/chart.js/chartjs-plugin-datalabels.min.js"></script>
<script src="include/chart.js/chartjs-plugin-colorschemes.min.js"></script>
<script src="include/chart.js/randomColor.js"></script>

<input id="homeLayout" type="hidden" value="{$LAYOUT}">
{*<!--Home Page Entries  -->*}

{*<!-- Dashboard -->*}
<div id="MainMatrix" class="container-fluid slds-p-around_small">
	<div class="slds-grid slds-grid_vertical slds-p-around_x-small slds-p-bottom_x-small dash-bg-white">
		<div class="slds-col slds-border_bottom">
			{include file="Home/HomeDashboardHeader.tpl"}
			<div id="vtbusy_homeinfo" style="display:none;">
				<img src="{'vtbusy.gif'|@vtiger_imageurl:$THEME}" border="0">
			</div>
		</div>
		<div class="slds-col grid-stack" data-gs-animate="yes">
			{*<!-- Dashboard Widgets Panel -->*}
			{foreach item=tablestuff from=$HOMEFRAME name="homeframe"}
				{*<!-- create divs for each widget - the contents will be loaded dynamically from javascript -->*}
				{include file="Home/HomeDashboardGrids.tpl"}
			{/foreach}
		</div>
	</div>
</div>
{*<!-- Main Contents Ends Here -->*}

<script type="text/javascript">
	var gridcols = GridStack.init({
		compact: true,
		resizable: {
			handles: 'e, se, s, sw, w'
		}
	});

	gridcols();
</script>

<script>
	{*<!-- position the div in the page -->*}
	window.onresize = function(){ldelim}positionDivInAccord('stuff_{$tablestuff.Stuffid}','{$tablestuff.Stufftitle|escape:'quotes'}','{$tablestuff.Stufftype}');{rdelim};
	positionDivInAccord('stuff_{$tablestuff.Stuffid}','{$tablestuff.Stufftitle|escape:'quotes'}','{$tablestuff.Stufftype}');
</script>

<script>
	var Vt_homePageWidgetInfoList = [
	{if $HOMEFRAME|@count > 0}
		{assign var=HOMEFRAME value=$HOMEFRAME|@array_reverse}
		{foreach item=tablestuff key=index from=$HOMEFRAME name="homeframe"}
			{if ($tablestuff.Stufftype neq 'Default' || $tablestuff.Stufftitle neq 'Home Page Dashboard'|@getTranslatedString:'Home')
					&& $tablestuff.Stufftype neq 'DashBoard' && $tablestuff.Stufftype neq 'ReportCharts'}
				{ldelim}
					'widgetId':{$tablestuff.Stuffid},
					'widgetType':'{$tablestuff.Stufftype}'
				{rdelim}
				{if $index+1 < $HOMEFRAME|@count},{/if}
			{/if}
		{/foreach}
	{/if}
		];
	loadAllWidgets(Vt_homePageWidgetInfoList, {$widgetBlockSize});
	{literal}
	initHomePage();

	/**
	* this function is used to display the add window for different dashboard widgets
	*/
	function fnAddWindow(obj, CurrObj) {
		var tagName = document.getElementById(CurrObj);
		var left_Side = findPosX(obj);
		var top_Side = findPosY(obj);
		tagName.style.left= left_Side + 2 + 'px';
		tagName.style.top= top_Side + 22 + 'px';
		tagName.style.display = 'block';
		document.getElementById("addmodule").href="javascript:chooseType('Module');fnRemoveWindow();setFilter(document.getElementById('selmodule_id'))";
		document.getElementById("addNotebook").href="javascript:chooseType('Notebook');fnRemoveWindow();show('addWidgetsDiv');placeAtCenter(document.getElementById('addWidgetsDiv'));";
		document.getElementById("defaultwidget").href="javascript:chooseType('defaultwidget');fnRemoveWindow();";
		//document.getElementById("addURL").href="javascript:chooseType('URL');fnRemoveWindow();show('addWidgetsDiv');placeAtCenter(document.getElementById('addWidgetsDiv'));";
	{/literal}
	{if $ALLOW_RSS eq "yes"}
		document.getElementById("addrss").href="javascript:chooseType('RSS');fnRemoveWindow();show('addWidgetsDiv');placeAtCenter(document.getElementById('addWidgetsDiv'));";
	{/if}
	{if $ALLOW_DASH eq "yes"}
		document.getElementById("adddash").href="javascript:chooseType('DashBoard');fnRemoveWindow()";
	{/if}
	{if $ALLOW_REPORT eq "yes"}
		document.getElementById("addReportCharts").href="javascript:chooseType('ReportCharts');fnRemoveWindow()";
	{/if}
	{literal}
	}
	{/literal}
	var user_tag_showas = '{$USER_TAG_SHOWAS}';

	{* First time login *}
	{if $FIRST_TIME_LOGIN}
		{include file="Home/FirstTimeLogin.tpl"}
	{/if}

	// Menu (add items button) 
	$('#addWidgetDropDown_btn').on('click',function(){
		$('#addWidgetDropDown_').toggle();
	}); 

	$('#addWidgetDropDown_').mouseenter(function() {
		$('#addWidgetDropDown_').show();
	});
	$('#addWidgetDropDown_').mouseleave(function() {
		$('#addWidgetDropDown_').hide();
	});
	
</script>


