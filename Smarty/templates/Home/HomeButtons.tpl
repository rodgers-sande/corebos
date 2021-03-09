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
<div id="page-header-placeholder"></div>
{*<div id="page-header" class="slds-page-header slds-m-vertical_medium">
	<div class="slds-page-header__row">
		<div class="slds-page-header__col-title">
			<div class="slds-media"> 
				<div class="slds-media__figure">
					<a class="hdrLink" href="index.php?action=index&module={$MODULE}">
						<span class="slds-icon_container slds-icon-standard-home" title="{$MODULE|@getTranslatedString:$MODULE}">
							<svg class="slds-icon slds-page-header__icon" id="page-header-icon" aria-hidden="true">
								<use xmlns:xlink="http://www.w3.org/1999/xlink"
									xlink:href="include/LD/assets/icons/standard-sprite/svg/symbols.svg#home" />
							</svg>
							<span class="slds-assistive-text">{$MODULE|@getTranslatedString:$MODULE}</span>
						</span>
					</a>
				</div>
				<div class="slds-media__body">
					<div class="slds-page-header__name">
						<div class="slds-page-header__name-title">
							<h1>
								<span>{$MODULE|@getTranslatedString:$MODULE}</span>
								<span class="slds-page-header__title slds-truncate" title="{$MODULE|@getTranslatedString:$MODULE|@addslashes}">
									<a class="hdrLink" href="index.php?action=index&module={$MODULE}">{'My Home Page'|@getTranslatedString:$MODULE}</a>
								</span>
							</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slds-page-header__col-actions">
			<div class="slds-page-header__controls">
				<div class="slds-page-header__control">
					<ul class="slds-button-group-list">
						<li class="slds-m-right_small slds-m-top_x-small">
							<span id="vtbusy_info" style="display:none;">
								<div role="status" class="slds-spinner slds-spinner_brand slds-spinner_x-small" style="position:relative; top:6px;">
									<div class="slds-spinner__dot-a"></div>
									<div class="slds-spinner__dot-b"></div>
								</div>
							</span>
						</li>
						<li>
							<button
								class="slds-button slds-button_neutral"
								onClick='fnAddWindow(this,"addWidgetDropDown");'
								onMouseOut='fnRemoveWindow();'>
									{$MOD.LBL_HOME_ADDWINDOW}
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="page-header-surplus">
		<div class="slds-page-header__row">
			<div class="slds-page-header__col-meta" style="min-width: 0;">
				<div class="slds-page-header__meta-text slds-grid">
					{if !empty($isDetailView) || !empty($isEditView)}
					<div class="slds-p-right_small">{$UPDATEINFO}</div>
					{/if}
					{assign var=ANNOUNCEMENT value=get_announcements()}
					{if $ANNOUNCEMENT}
					<style>
						#marquee span {
							display: inline-block;
							padding-left: 100%;
							animation: marquee {$ANNOUNCEMENT|count_characters / 3}s linear infinite;
						}
						#marquee span:hover {
							animation-play-state: paused
						}
						@keyframes marquee {
							0% {
							transform: translate(0, 0);
							}
							100% {
							transform: translate(-100%, 0);
							}
						}
					</style>
					<div class="slds-col slds-truncate" id="marquee">
						<span>{$ANNOUNCEMENT}</span>
					</div>
					{/if}
				</div>
			</div>
			<div class="slds-page-header__col-controls">
				<div class="slds-page-header__controls">
					<div class="slds-page-header__control">
						{if $ANNOUNCEMENT}
						<button
							class="slds-button slds-button_icon slds-button_icon-border-filled"
							aria-haspopup="true"
							style="transform: scale(-1,1); color: #d3451d;">
								<svg class="slds-button__icon" aria-hidden="true">
									<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#announcement"></use>
								</svg>
						</button>
						{/if}
						<div class="slds-button-group" role="group">
							
							{if $CALENDAR_DISPLAY eq 'true'}
								{$canusecalendar = true}
								{if $CHECK.Calendar != 'yes'}
									{$canusecalendar = false}
								{/if}
							<button
								class="slds-button slds-button_icon slds-button_icon-border-filled"
								aria-haspopup="true"
								{if $canusecalendar == false}disabled=""{/if}
								onclick="fnvshobj(this,'miniCal');getITSMiniCal('');"
								title="{$APP.LBL_CALENDAR_TITLE}">
									<svg class="slds-button__icon" aria-hidden="true">
										<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#monthlyview"></use>
									</svg>
									<span class="slds-assistive-text">
										{$APP.LBL_CALENDAR_TITLE}
									</span>
							</button>
							{/if}
							
							{if $WORLD_CLOCK_DISPLAY eq 'true'}
							<button
								class="slds-button slds-button_icon slds-button_icon-border-filled"
								aria-haspopup="true"
								onClick="fnvshobj(this,'wclock');"
								title="{$APP.LBL_CLOCK_TITLE}">
									<svg class="slds-button__icon" aria-hidden="true">
										<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#world"></use>
									</svg>
									<span class="slds-assistive-text">
										{$APP.LBL_CLOCK_TITLE}
									</span>
							</button>
							{/if}
							
							<button
								class="slds-button slds-button_icon slds-button_icon-border-filled"
								aria-haspopup="true"
								title="{$MOD.LBL_HOME_LAYOUT}"
								onclick='showOptions("changeLayoutDiv");'>
									<svg class="slds-button__icon" aria-hidden="true">
										<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#layout"></use>
									</svg>
									<span class="slds-assistive-text">
										{$MOD.LBL_HOME_LAYOUT}
									</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>*}
<div id="page-header" class="slds-m-vertical_medium slds-border_bottom slds-p-bottom_x-small dash-item-bg-grey">
	<div class="slds-page-header__row slds-grid_vertical-align-center">
		<div class="slds-page-header__col-title">
			<div class="slds-media">
				<div class="slds-media__figure">
					<a class="hdrLink" href="index.php?action=index&module={$MODULE}">
						<span class="slds-icon_container slds-icon-standard-home" title="{$MODULE|@getTranslatedString:$MODULE}">
							<svg class="slds-icon slds-page-header__icon" id="page-header-icon" aria-hidden="true">
								<use xmlns:xlink="http://www.w3.org/1999/xlink"
									xlink:href="include/LD/assets/icons/standard-sprite/svg/symbols.svg#home" />
							</svg>
							<span class="slds-assistive-text">{$MODULE|@getTranslatedString:$MODULE}</span>
						</span>
					</a>
				</div>
				<div class="slds-media__body">
					<div class="slds-page-header__name">
						<div class="slds-page-header__name-title">
							<h1>
								<span>{$MODULE|@getTranslatedString:$MODULE}</span>
								<span class="slds-page-header__title slds-truncate" title="{$MODULE|@getTranslatedString:$MODULE|@addslashes}">
									<a class="hdrLink" href="index.php?action=index&module={$MODULE}">{'My Home Page'|@getTranslatedString:$MODULE}</a>
								</span>
							</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slds-page-header__col-actions">
			<div class="slds-page-header__controls">
				<div class="slds-page-header__control">
					<ul class="slds-button-group-list">
						<li class="slds-m-right_small slds-m-top_x-small">
							<span id="vtbusy_info" style="display:none;">
								<div role="status" class="slds-spinner slds-spinner_brand slds-spinner_x-small" style="position:relative; top:6px;">
									<div class="slds-spinner__dot-a"></div>
									<div class="slds-spinner__dot-b"></div>
								</div>
							</span>
						</li>
						<li>
							<a class="slds-button"
								onClick='fnAddWindow(this,"addWidgetDropDown");'
								onMouseOut='fnRemoveWindow();'>
								<span class="slds-icon_container slds-icon_container_circle slds-icon-action-description" title="{$MOD.LBL_HOME_ADDWINDOW}">
									<svg class="slds-icon slds-icon_x-small" aria-hidden="true">
										<use xmlns:xlink="http://www.w3.org/1999/xlink"
											xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#add" />
									</svg>
									<span class="slds-assistive-text">{$MOD.LBL_HOME_ADDWINDOW}</span>
								</span>
							</a>
						</li>
						<li>
							<a>
								<span class="slds-icon_container slds-icon_container_circle homeactions">
									<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
										<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#threedots_vertical"></use>
									</svg>
								</span>
							</a>

							<div class="slds-dropdown slds-dropdown_right slds-dropdown_actions homeactions_items">
								<ul class="slds-dropdown__list" role="menu">
									<li class="slds-dropdown__item" role="presentation">
										<a role="menuitem" tabindex="0" onclick="fnvshobj(this,'miniCal');getITSMiniCal('');">
											<span class="slds-truncate" title="Overflow Item One">
												{* Calendar button *}
												{if $CALENDAR_DISPLAY eq 'true'}
													{$canusecalendar = true}
													{if $CHECK.Calendar != 'yes'}
														{$canusecalendar = false}
													{/if}
												<button
													class="slds-button slds-button_icon"
													aria-haspopup="true"
													{if $canusecalendar == false}disabled=""{/if}
													title="{$APP.LBL_CALENDAR_TITLE}">
														<svg class="slds-button__icon" aria-hidden="true">
															<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#monthlyview"></use>
														</svg>
														<span class="slds-assistive-text">
															{$APP.LBL_CALENDAR_TITLE}
														</span>
												</button>
												<span class="slds-truncate" title="{$APP.LBL_CALENDAR_TITLE}"> {$APP.LBL_CALENDAR_TITLE} </span>
												{/if}
											</span>
										</a>
									</li>
									<li class="slds-dropdown__item" role="presentation">
										<a role="menuitem" tabindex="-1" 
											onClick="fnvshobj(this,'wclock');">
										{* World clock button *}
										{if $WORLD_CLOCK_DISPLAY eq 'true'}
										<button
											class="slds-button slds-button_icon"
											aria-haspopup="true"
											title="{$APP.LBL_CLOCK_TITLE}">
												<svg class="slds-button__icon" aria-hidden="true">
													<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#world"></use>
												</svg>
												<span class="slds-assistive-text">
													{$APP.LBL_CLOCK_TITLE}
												</span>
										</button>
										<span class="slds-truncate" title="{$APP.LBL_CLOCK_TITLE}"> {$APP.LBL_CLOCK_TITLE} </span>
										{/if}
										</a>
									</li>
									<li class="slds-dropdown__item" role="presentation">
										<a id='changeLayoutDivBtn' role="menuitem" tabindex="-1">
										{* Change layout button *}
											<button
												class="slds-button slds-button_icon"
												aria-haspopup="true"
												title="{$MOD.LBL_HOME_LAYOUT}">
													<svg class="slds-button__icon" aria-hidden="true">
														<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#layout"></use>
													</svg>
													<span class="slds-assistive-text">
														{$MOD.LBL_HOME_LAYOUT}
													</span>
											</button>
											<span class="slds-truncate" title="{$MOD.LBL_HOME_LAYOUT}"> {$MOD.LBL_HOME_LAYOUT} </span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
{*<!--button related stuff -->*}
<form name="Homestuff" id="formStuff" style="display: inline;" method="post">
	<input type="hidden" name="action" value="homestuff">
	<input type="hidden" name="module" value="Home">
	<div id='addWidgetDropDown' class="slds-dropdown slds-dropdown_right slds-m-right_small slds-dropdown_actions addWidgetsMain" onmouseover='fnShowWindow()' onmouseout='fnRemoveWindow()'>
	<ul class="slds-dropdown__list" role="menu">
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="addmodule">
				{$MOD.LBL_HOME_MODULE}
			</a>
		</li>
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:chooseType("CustomWidget");fnRemoveWindow();setFilter(document.getElementById("selmodule_id"));' role="menuitem" id="addcustomwidget">
				{$MOD.LBL_HOME_CUSTOM_WIDGET}
			</a>
		</li>
{if $ALLOW_RSS eq "yes"}
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="addrss">
				{$MOD.LBL_HOME_RSS}
			</a>
		</li>
{/if}
{if $ALLOW_DASH eq "yes"}
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="adddash">
				{$MOD.LBL_HOME_DASHBOARD}
			</a>
		</li>
{/if}
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="addNotebook">
				{$MOD.LBL_NOTEBOOK}
			</a>
		</li>

{if $ALLOW_REPORT eq "yes"}
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="addReportCharts">
				{'LBL_REPORTCHARTS'|@getTranslatedString:$MODULE}
			</a>
		</li>
{/if}
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="defaultwidget">
				{'LBL_DEFAULT_WIDGET'|@getTranslatedString:$MODULE}
			</a>
		</li>
		{*<!-- this has been commented as some websites are opening up in full page (they have a target="_top")
		<li class="slds-dropdown__item" role="presentation">
			<a href='javascript:;' role="menuitem" id="addURL">
				{$MOD.LBL_URL}
			</a>
		</li>
		-->*}
	</div>

	{*<!-- the following div is used to display the contents for the add widget window -->*}
	<div id="addWidgetsDiv" class="layerPopup addWidgetsModal slds-modal slds-fade-in-open" style="display:none;">
		<div class="slds-modal__container">
			<header class="slds-modal__header">
			{*<div id="divHeader" class="slds-text-heading_medium"></div>*}
			<button onclick="fnhide('addWidgetsDiv');document.getElementById('stufftitle_id').value='';" class="slds-button slds-button_icon slds-modal__close slds-button_icon-inverse" title="Close">
				<svg class="slds-button__icon slds-button__icon_large" aria-hidden="true">
				<use xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#close"></use>
				</svg>
				<span class="slds-assistive-text">Close</span>
			</button>
			<h2 id="divHeader" class="slds-modal__title slds-hyphenate"></h2>
			</header>
			<div class="slds-modal__content slds-p-around_medium" id="modal-content-id-1">
			<input type="hidden" name="stufftype" id="stufftype_id">
			<div class="slds-grid">
				<div class="slds-col" id="StuffTitleId">
					<div class="slds-form-element">
						<label class="slds-form-element__label" for="text-input-id-1">
							<abbr class="slds-required" title="required">* </abbr>{$MOD.LBL_HOME_STUFFTITLE}</label>
							<div class="slds-form-element__control">
								<input type="text" name="stufftitle" id="stufftitle_id" class="detailedViewTextBox slds-input">
							</div>
					</div>
					<div class="slds-form-element" id="showrow">
						<label class="slds-form-element__label" for="maxentryid" id="fixed-text-label">{$MOD.LBL_HOME_SHOW}</label>
							<div class="slds-form-element__control slds-input-has-fixed-addon">
								<select name="maxentries" id="maxentryid" class="slds-select">
									{section name=iter start=1 loop=13 step=1}
									<option value="{$smarty.section.iter.index}">{$smarty.section.iter.index}</option>
									{/section}
								</select>
								<span class="slds-form-element__addon" id="fixed-text-addon-post">{$MOD.LBL_HOME_ITEMS}</span>
							</div>
					</div>
					<div class="slds-form-element" id="moduleNameRow">
						<label class="slds-form-element__label" for="moduleNameRow"> {$MOD.LBL_HOME_MODULE}</label>
						<div class="slds-form-element__control">
							<div class="slds-select_container">
							<select name="selmodule" id="selmodule_id" onchange="setFilter(this)" class="slds-select">
							{foreach item=arr from=$MODULE_NAME}
								{assign var="MODULE_LABEL" value=$arr.1|getTranslatedString:$arr.1}
								<option value="{$arr.1}">{$MODULE_LABEL}</option>
							{/foreach}
						</select>
						<input type="hidden" name="fldname">
							</div>
						</div>
					</div>
					<div class="slds-form-element slds-grid slds-grid_vertical" id="moduleFilters">
						<div class="slds-col" id="filterby">
							<label class="slds-form-element__label" for="moduleNameRow"> {$MOD.LBL_HOME_FILTERBY}</label>
						</div>
						<div class="slds-col" id="filterbyim">
							<button class="slds-button slds-button_icon slds-button_icon slds-button_icon-border" aria-haspopup="true" title="{$MOD.LBL_HOME_FILTERBY}" onClick='filterValidate();' onMouseOut='fnRemoveWindow();'> 
								<svg class="slds-button__icon" aria-hidden="true">
									<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#add"></use>
								</svg>
								<span class="slds-assistive-text">{$MOD.LBL_HOME_FILTERBY}</span>
							</button>
						</div>
						<div class="slds-col" id="selModFilter_id">
						</div>
					</div>
					<div class="slds-form-element" id="moduleLabelsRow">
						<label class="slds-form-element__label" for="moduleLabelsRow" id="aggr"> {$MOD.LBL_HOME_AGGREGATE} </label>
						<div class="slds-form-element__control">
							<select class="slds-select" id="selModAggregate_id" multiple="">
								<option value="sum">{'SUM'|getTranslatedString:'Reports'}</option>
								<option value="avg">{'AVG'|getTranslatedString:'Reports'}</option>
								<option value="max">{'MAX'|getTranslatedString:'Reports'}</option>
								<option value="min">{'MIN'|getTranslatedString:'Reports'}</option>
								<option value="count">{'COUNT'|getTranslatedString:'Reports'}</option>
							</select>
						</div>
					</div>
					<div class="slds-form-element" id="moduleCombosRow">
						<label class="slds-form-element__label" for="moduleCombosRow" id="fields">
							{$MOD.LBL_HOME_AG_FIELDS} </label>
						<div class="slds-form-element__control" id="selModPrime_id">
						</div>
					</div>
				</div>
			</div>
			<table border=0 cellspacing=0 cellpadding=5 width=95% align=center>
			<tr>
				<td class=small >
				{*<!-- popup specific content fill in starts -->*}
				<table border="0" cellspacing="0" cellpadding="3" width="100%" align="center" bgcolor="white">
				
				{*<!--
				<tr id="homeURLField" style="display:block;">
					<td class="dvtCellLabel" width="110" align="right">
						{$MOD.LBL_URL}
						<font color='red'>*</font>
					</td>
					<td class="dvtCellInfo" colspan="2" width="300">
						<input type="text" name="url" id="url_id" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:57%">
					</td>
				</tr>
				-->*}
				{*<tr id="showrow">
					<td class="dvtCellLabel" width="110" align="right">{$MOD.LBL_HOME_SHOW}</td>
					<td class="dvtCellInfo" width="300" colspan="2">
						<select name="maxentries" id="maxentryid" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:60%">
							{section name=iter start=1 loop=13 step=1}
							<option value="{$smarty.section.iter.index}">{$smarty.section.iter.index}</option>
							{/section}
						</select>&nbsp;&nbsp;{$MOD.LBL_HOME_ITEMS}
					</td>
				</tr>*}
				{*<tr id="moduleNameRow" style="display:block">
					<td class="dvtCellLabel" width="110" align="right">{$MOD.LBL_HOME_MODULE}</td>
					<td width="300" class="dvtCellInfo" colspan="2">
						<select name="selmodule" id="selmodule_id" onchange="setFilter(this)" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:60%">
							{foreach item=arr from=$MODULE_NAME}
								{assign var="MODULE_LABEL" value=$arr.1|getTranslatedString:$arr.1}
								<option value="{$arr.1}">{$MODULE_LABEL}</option>
							{/foreach}
						</select>
						<input type="hidden" name="fldname">
					</td>
				</tr>*}
				{*<tr id="moduleFilters" style="display:block">
					<td class="dvtCellLabel" id="filterby" align="right" width="110" >{$MOD.LBL_HOME_FILTERBY}</td>
					<td class="dvtCellLabel" id="filterbyim" align="right" width="110" ><img width="27" height="27" alt"{$MOD.LBL_HOME_ADDWINDOW}" onClick='filterValidate();' onMouseOut='fnRemoveWindow();' src="{'btnL3Add.gif'|@vtiger_imageurl:$THEME}" border="0" title="{$MOD.LBL_HOME_ADDWINDOW}" style="cursor:pointer;">
						&nbsp;{$MOD.LBL_HOME_FILTERBY}
					</td>
					<td id="selModFilter_id" width="300" colspan="2" class="dvtCellInfo"> </td>
				</tr>*}
				{*<tr id="moduleLabelsRow" style="display:block">
					<td class="dvtCellLabel" align="right" id="aggr" width="110">{$MOD.LBL_HOME_AGGREGATE}</td>
					<td id="selModAggregate_id" width="300" colspan="2" class="dvtCellInfo">
						<select class="detailedViewTextBox" id="selAggregateid" name="selAggregatename" style="width:60%">
						<option value="sum">{'SUM'|getTranslatedString:'Reports'}</option>
						<option value="avg">{'AVG'|getTranslatedString:'Reports'}</option>
						<option value="max">{'MAX'|getTranslatedString:'Reports'}</option>
						<option value="min">{'MIN'|getTranslatedString:'Reports'}</option>
						<option value="count">{'COUNT'|getTranslatedString:'Reports'}</option>
						</select>
					</td>
				</tr>*}
				{*<tr id="moduleCombosRow" style="display:block">
					<td class="dvtCellLabel" align="right" id="fields" width="110">{$MOD.LBL_HOME_AG_FIELDS}</td>
					<td id="selModPrime_id" width="300" colspan="2" class="dvtCellInfo"></td>
				</tr>*}
				<tr id="rssRow" style="display:none">
					<td class="dvtCellLabel" width="110" align="right">{$MOD.LBL_HOME_RSSURL}<font color='red'>*</font></td>
					<td width="300" colspan="2" class="dvtCellInfo"><input type="text" name="txtRss" id="txtRss_id" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:58%"></td>
				</tr>
				<tr id="dashNameRow" style="display:none">
					<td class="dvtCellLabel" width="110" align="right">{$MOD.LBL_HOME_DASHBOARD_NAME}</td>
					<td id="selDashName" class="dvtCellInfo" colspan="2" width="300"></td>
				</tr>
				<tr id="homewidget" style="display:none">
					<td id="home" class="dvtCellInfo" colspan="2" width="300"></td>
				</tr>
				<tr id="dashTypeRow" style="display:none">
					<td class="dvtCellLabel" align="right" width="110">{$MOD.LBL_HOME_DASHBOARD_TYPE}</td>
					<td id="selDashType" class="dvtCellInfo" width="300" colspan="2">
						<select name="seldashtype" id="seldashtype_id" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:60%">
							<option value="horizontalbarchart">{$MOD.LBL_HOME_HORIZONTAL_BARCHART}</option>
							<option value="verticalbarchart">{$MOD.LBL_HOME_VERTICAL_BARCHART}</option>
							<option value="piechart">{$MOD.LBL_HOME_PIE_CHART}</option>
						</select>
					</td>
				</tr>
				<tr id="reportNameRow" style="display:none">
					<td class="dvtCellLabel" width="110" align="right">{'LBL_HOME_REPORT_NAME'|@getTranslatedString:$MODULE}</td>
					<td id="selReportName" class="dvtCellInfo" colspan="2" width="300"></td>
				</tr>
				<tr id="reportTypeRow" style="display:none">
					<td class="dvtCellLabel" align="right" width="110">{'LBL_HOME_REPORT_TYPE'|@getTranslatedString:$MODULE}</td>
					<td id="selReportType" class="dvtCellInfo" width="300" colspan="2">
						<select name="selreporttype" id="selreportcharttype_id" class="detailedViewTextBox" onfocus="this.className='detailedViewTextBoxOn'" onblur="this.className='detailedViewTextBox'" style="width:60%">
							<option value="horizontalbarchart">{$MOD.LBL_HOME_HORIZONTAL_BARCHART}</option>
							<option value="verticalbarchart">{$MOD.LBL_HOME_VERTICAL_BARCHART}</option>
							<option value="piechart">{$MOD.LBL_HOME_PIE_CHART}</option>
						</select>
					</td>
				</tr>
			</table>
				{*<!-- popup specific content fill in ends -->*}
				</td>
			</tr>
			</table>

			</div>
			<footer class="slds-modal__footer">
			<button class="slds-button slds-button_neutral" onclick="fnhide('addWidgetsDiv');document.getElementById('stufftitle_id').value='';"> {$APP.LBL_CANCEL_BUTTON_LABEL} </button>
			<button class="slds-button slds-button_brand" id="savebtn" onclick="frmValidate()" > {$APP.LBL_SAVE_BUTTON_LABEL} </button>
			</footer>
		</div>

	</div>
</form>
{*<!-- add widget code ends -->*}

<div id="seqSettings" style="background-color:#E0ECFF;z-index:6000000;display:none;">
</div>


{*<!-- change layout modal -->*}
<section id="changeLayoutDivHome" role="dialog" tabindex="-1" aria-modal="true" aria-describedby="changeLayoutDivContent" class="slds-modal slds-modal_small">
	<div class="slds-modal__container">
		<header class="slds-modal__header slds-modal__header_empty">
			<button class="slds-button slds-button_icon slds-modal__close slds-button_icon-inverse layoutModalCancel">
				<span class="slds-icon_container slds-icon-utility-close">
					<svg class="slds-icon" aria-hidden="true">
						<use xmlns:xlink="http://www.w3.org/1999/xlink"
							xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#close" />
					</svg>
					<span class="slds-assistive-text">Close</span>
				</span>
			</button>
		</header>
		<div class="slds-modal__content slds-p-around_medium" id="changeLayoutDivContent">
			<fieldset class="slds-form-element">
				<div class="slds-form-element__control">
					<div class="slds-radio_button-group layout-icons-group">
						<span class="slds-button slds-radio_button">
							<input type="radio" name="layout-colum-selection" id="1-column-layout" value="1" />
							<label for="1-column-layout">
								<svg class="slds-p-top_xx-small" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 56"><title>1 column</title><path d="M71.94,23A5.07,5.07,0,0,1,77,28.06V71.94A5.07,5.07,0,0,1,71.94,77H28.06A5.07,5.07,0,0,1,23,71.94V28.06A5.07,5.07,0,0,1,28.06,23H71.94m0-1H28.06A6.06,6.06,0,0,0,22,28.06V71.94A6.06,6.06,0,0,0,28.06,78H71.94A6.06,6.06,0,0,0,78,71.94V28.06A6.06,6.06,0,0,0,71.94,22Z" transform="translate(-22 -22)" style="fill:#706e6b"/><rect x="5.5" y="5.5" width="45" height="45" rx="3.03" style="fill:#706e6b"/></svg>
								1 Column
							</label> 
						</span>
						<span class="slds-button slds-radio_button">
							<input type="radio" name="layout-colum-selection" id="2-column-layout" value="2" />
							<label for="2-column-layout">
								<svg class="slds-p-top_xx-small" id="Layer_2" data-name="Layer 2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 56"><title>{$MOD.LBL_TWO_COLUMN}</title><path d="M49.94,1A5.08,5.08,0,0,1,55,6.06V49.94A5.08,5.08,0,0,1,49.94,55H6.06A5.08,5.08,0,0,1,1,49.94V6.06A5.08,5.08,0,0,1,6.06,1H49.94m0-1H6.06A6.06,6.06,0,0,0,0,6.06V49.94A6.06,6.06,0,0,0,6.06,56H49.94A6.06,6.06,0,0,0,56,49.94V6.06A6.06,6.06,0,0,0,49.94,0Z" style="fill:#706e6b"/><path d="M32.77,5.5H47a2.85,2.85,0,0,1,2.62,3V47.47a2.85,2.85,0,0,1-2.62,3H32.77a2.85,2.85,0,0,1-2.62-3V8.53A2.85,2.85,0,0,1,32.77,5.5Z" style="fill:#706e6b"/><path d="M9,5.5H23.23a2.85,2.85,0,0,1,2.62,3V47.47a2.85,2.85,0,0,1-2.62,3H9a2.85,2.85,0,0,1-2.62-3V8.53A2.85,2.85,0,0,1,9,5.5Z" style="fill:#706e6b"/></svg>
								{$MOD.LBL_TWO_COLUMN}
							</label> 
						</span>
						<span class="slds-button slds-radio_button">
							<input type="radio" name="layout-colum-selection" id="3-column-layout" value="3" />
							<label for="3-column-layout">
							<svg class="slds-p-top_xx-small" id="Layer_3" data-name="Layer 3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 56"><title>{$MOD.LBL_THREE_COLUMN}</title><path d="M49.94,1A5.08,5.08,0,0,1,55,6.06V49.94A5.08,5.08,0,0,1,49.94,55H6.06A5.08,5.08,0,0,1,1,49.94V6.06A5.08,5.08,0,0,1,6.06,1H49.94m0-1H6.06A6.06,6.06,0,0,0,0,6.06V49.94A6.06,6.06,0,0,0,6.06,56H49.94A6.06,6.06,0,0,0,56,49.94V6.06A6.06,6.06,0,0,0,49.94,0Z" style="fill:#706e6b"/><path d="M39.15,5.5h8.76a2.16,2.16,0,0,1,1.94,2.32V48.18a2.16,2.16,0,0,1-1.94,2.32H39.15a2.16,2.16,0,0,1-1.94-2.32V7.82A2.16,2.16,0,0,1,39.15,5.5Z" style="fill:#706e6b"/><path d="M23.62,5.5h8.76a2.16,2.16,0,0,1,1.94,2.32V48.18a2.16,2.16,0,0,1-1.94,2.32H23.62a2.16,2.16,0,0,1-1.94-2.32V7.82A2.16,2.16,0,0,1,23.62,5.5Z" style="fill:#706e6b"/><path d="M8.09,5.5h8.76a2.16,2.16,0,0,1,1.94,2.32V48.18a2.16,2.16,0,0,1-1.94,2.32H8.09a2.16,2.16,0,0,1-1.94-2.32V7.82A2.16,2.16,0,0,1,8.09,5.5Z" style="fill:#706e6b"/></svg>
								{$MOD.LBL_THREE_COLUMN}
							</label> 
						</span>
						<span class="slds-button slds-radio_button">
							<input type="radio" name="layout-colum-selection" id="4-column-layout" value="4" />
							<label for="4-column-layout">
							<svg class="slds-p-top_xx-small" id="Layer_4" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 56 56"><title>{$MOD.LBL_FOUR_COLUMN}</title><path d="M43.41,5.79h6.18c.62,0,1.13.72,1.13,1.59V49.2c0,.88-.51,1.59-1.13,1.59H43.41c-.62,0-1.13-.71-1.13-1.59V7.38C42.28,6.51,42.79,5.79,43.41,5.79Z" style="fill:#706e6b"/><path d="M31.09,5.79h6.18c.62,0,1.13.72,1.13,1.59V49.2c0,.88-.51,1.59-1.13,1.59H31.09c-.63,0-1.13-.71-1.13-1.59V7.38C30,6.51,30.46,5.79,31.09,5.79Z" style="fill:#706e6b"/><path d="M18.76,5.79h6.18c.63,0,1.13.72,1.13,1.59V49.2c0,.88-.5,1.59-1.13,1.59H18.76c-.62,0-1.13-.71-1.13-1.59V7.38C17.63,6.51,18.14,5.79,18.76,5.79Z" style="fill:#706e6b"/><path d="M6.41,5.79h6.18c.62,0,1.13.72,1.13,1.59V49.2c0,.88-.51,1.59-1.13,1.59H6.41c-.62,0-1.13-.71-1.13-1.59V7.38C5.28,6.51,5.79,5.79,6.41,5.79Z" style="fill:#706e6b"/><path d="M49.94,1A5.08,5.08,0,0,1,55,6.06V49.94A5.08,5.08,0,0,1,49.94,55H6.06A5.08,5.08,0,0,1,1,49.94V6.06A5.08,5.08,0,0,1,6.06,1H49.94m0-1H6.06A6.06,6.06,0,0,0,0,6.06V49.94A6.06,6.06,0,0,0,6.06,56H49.94A6.06,6.06,0,0,0,56,49.94V6.06A6.06,6.06,0,0,0,49.94,0Z" style="fill:#706e6b"/></svg>
								{$MOD.LBL_FOUR_COLUMN}
							</label> 
						</span>
					</div>
				</div>
			</fieldset>
		</div>
		<footer class="slds-modal__footer">
			<button class="slds-button slds-button_neutral layoutModalCancel">Cancel</button>
			<button class="slds-button slds-button_brand" id='layoutModalSave' onclick="saveLayout();">Save</button>
		</footer>
	</div>
</section>
{*<!-- change layout modal end -->*}
<div class="slds-backdrop slds-backdrop_open overlay" style="display: none"></div>

