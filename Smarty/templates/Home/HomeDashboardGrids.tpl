<script src="include/gridstack.js" type="text/javascript"></script>
<script src="include/dashboardcb.js" type="text/javascript"></script>
<script src="include/gridstack.jQueryUI.js" type="text/javascript"></script>
<link rel="stylesheet" href="include/gridstack.css" type="text/css">
<link rel="stylesheet" href="include/gridstack-extra.css" type="text/css">

{*<!-- Widget Item begin -->*}
{*<!-- this file displays a widget div - the contents of the div are loaded later usnig javascript -->*}
{assign var="homepagedashboard_title" value='Home Page Dashboard'|@getTranslatedString:'Home'}
{assign var="keymetrics_title" value='Key Metrics'|@getTranslatedString:'Home'}
{assign var="stitle" value=$tablestuff.Stufftitle}
<script type="text/javascript">var vtdashboard_defaultDashbaordWidgetTitle = '{$homepagedashboard_title}';</script>
	<div id="stuff_{$tablestuff.Stuffid}" class="grid-stack-item slds-m-around_x-small" data-gs-width="4" data-gs-height="4">
		<div class="grid-stack-item-content dash-item-bg-light dash-decor-1">
			<div class="slds-grid slds-grid_vertical">
			{*<!-- Widget header begin -->*}
				<div class="slds-col slds-p-around_small" id="headerrow_{$tablestuff.Stuffid}">
					<div class="slds-page-header slds-page-header_related-list slds-p-vertical_xx-small">
						<div class="slds-page-header__row slds-grid_vertical-align-center widgetcard_header" onmouseleave="expandoptionshide()">
							<div class="slds-page-header__col-title">
								<div class="slds-media">
									<div class="slds-media__body">
									<div class="slds-page-header__name">
										<div class="slds-page-header__name-title">
										<div class="slds-text-heading_small">
											<h6 class="slds-text-heading_small slds-page-header__title slds-truncate" title="{$stitle}"> {$stitle} </h6>
										</div>
										</div>
									</div>
									</div>
								</div>
							</div>
							<div class="slds-page-header__col-actions">
								<div class="slds-page-header__controls">
									<div class="slds-page-header__control">
										<ul class="slds-button-group-list slds-grid_vertical-align-center">
											<li class="slds-p-around_xx-small">
												<button class="slds-button gridoptions_icon" onclick="expandoptions()">
													<span class="slds-icon_container slds-icon-utility-threedots">
														<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
															<use xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#threedots"></use>
														</svg>
													</span>
												</button>
											</li>
											<li class="slds-p-around_xx-small expand_gridoptions">
												<ul class="slds-button-group-list slds-grid_vertical-align-center">
													<li class="slds-p-around_xx-small" id="refresh_{$tablestuff.Stuffid}">
														<button class="slds-button">
															<span class="slds-icon_container slds-icon-utility-refresh" title="{$APP.LBL_REFRESH}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#refresh" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_REFRESH}</span>
															</span>
														</button>
													</li>
													<li>
													{*<!-- code for refresh button -->*}
													{if $tablestuff.Stufftitle eq $homepagedashboard_title}
														<button class="slds-button" onclick="fetch_homeDB({$tablestuff.Stuffid});">
															<span class="slds-icon_container slds-icon-utility-refresh" title="{$APP.LBL_REFRESH}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#refresh" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_REFRESH}</span>
															</span>
														</button>
													{else}
														<button class="slds-button" onclick="loadStuff({$tablestuff.Stuffid},'{$tablestuff.Stufftype}');">
															<span class="slds-icon_container slds-icon-utility-refresh" title="{$APP.LBL_REFRESH}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#refresh" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_REFRESH}</span>
															</span>
														</button>
													{/if}
													{*<!-- code for refresh button ends here -->*}
													</li>
													{*<!-- the edit button for widgets :: don't show for key metrics and dasboard widget -->*}
													{if ($tablestuff.Stufftype neq "Default" || $tablestuff.Stufftitle neq $keymetrics_title) && ($tablestuff.Stufftype neq "Default" || $tablestuff.Stufftitle neq $homepagedashboard_title) && ($tablestuff.Stufftype neq "Tag Cloud") && ($tablestuff.Stufftype neq "Notebook") && ( $tablestuff.Stufftype neq "CustomWidget")}
													<li class="slds-p-around_xx-small">
														<button class="slds-button" onclick="showEditrow({$tablestuff.Stuffid})">
															<span class="slds-icon_container slds-icon-utility-edit" title="{$APP.LBL_EDIT_BUTTON}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#edit" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_EDIT_BUTTON}</span>
															</span>
														</button>
													</li>
													{else}
													{if $tablestuff.Stufftitle eq $keymetrics_title}
													<li class="slds-p-around_xx-small">
														<a style='cursor:pointer;' href="index.php?module=Home&action=HomeBlock&homestuffid={$tablestuff.Stuffid}&blockstufftype={$tablestuff.Stufftype}" target="_blank">
															<button class="slds-button">
																<span class="slds-icon_container slds-icon-utility-edit" title="{$APP.LBL_EDIT_BUTTON}">
																	<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																		<use xmlns:xlink="http://www.w3.org/1999/xlink"
																			xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#edit" />
																	</svg>
																	<span class="slds-assistive-text">{$APP.LBL_EDIT_BUTTON}</span>
																</span>
															</button>
														</a>
													</li>
													{/if}
													<li class="slds-p-around_xx-small">
														<button class="slds-button" onclick="showEditrow({$tablestuff.Stuffid})">
															<span class="slds-icon_container slds-icon-utility-edit" title="{$APP.LBL_EDIT_BUTTON}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#edit" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_EDIT_BUTTON}</span>
															</span>
														</button>
													{/if}
													</li>
													{*<!-- code for edit button ends here -->*}
												</ul>
											</li>
											<li class="gridclose_icon slds-p-around_xx-small">
											{*<!-- code for delete button :: dont show for default widgets -->*}
											{if $tablestuff.Stufftype neq "Default" && $tablestuff.Stufftype neq "Tag Cloud"}
												<button class="slds-button" id="deletelink" onclick="DelStuff({$tablestuff.Stuffid})">
													<span class="slds-icon_container slds-icon-utility-close" title="{'LBL_CLOSE'|@getTranslatedString}">
														<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
															<use xmlns:xlink="http://www.w3.org/1999/xlink"
																xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#close" />
														</svg>
														<span class="slds-assistive-text">{'LBL_CLOSE'|@getTranslatedString}</span>
													</span>
												</button>
											{else}
												<button class="slds-button">
													<span class="slds-icon_container slds-icon-utility-close" title="{$APP.LBL_CLOSE}">
														<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
															<use xmlns:xlink="http://www.w3.org/1999/xlink"
																xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#close" />
														</svg>
														<span class="slds-assistive-text">{$APP.LBL_CLOSE}</span>
													</span>
												</button>
											{/if}
											{*<!-- code for delete button ends here -->*}
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				{*<!-- Widget header end -->*}
				{*<!-- Widget maincontent begin -->*}
				{if $tablestuff.Stufftype eq "Module"}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-p-around_small">
				{elseif $tablestuff.Stufftype eq "Default" && $tablestuff.Stufftitle neq $homepagedashboard_title}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="slds-col slds-p-around_small show_tab winmarkModulesdef"></div>
				{elseif $tablestuff.Stufftype eq "RSS"}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="slds-col slds-p-around_small show_tab"></div>
				{elseif $tablestuff.Stufftype eq "DashBoard" || $tablestuff.Stufftype eq "ReportCharts"}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-p-around_small slds-col"></div>
				{elseif $tablestuff.Stufftype eq "Default" && $tablestuff.Stufftitle eq $homepagedashboard_title}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-p-around_small slds-col"></div>
				{elseif $tablestuff.Stufftype eq "Notebook" || $tablestuff.Stufftype eq "Tag Cloud"}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="slds-p-around_small slds-col"></div>
				{else}
					<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-p-around_small slds-col">
				{/if}
					</div>
				{*<!-- Widget maincontent end -->*}
				{*Widget footer content begin*}
				<div class="slds-col slds-p-around_small">
					{if $tablestuff.Stufftype eq "Module"}
							<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-col slds-p-around_small"></div>
								{elseif $tablestuff.Stufftype eq "Default" && $tablestuff.Stufftitle neq $homepagedashboard_title}
										<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab winmarkModulesdef slds-col slds-p-around_small"></div>
								{elseif $tablestuff.Stufftype eq "RSS"}
										<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-col slds-p-around_small"></div>
								{elseif $tablestuff.Stufftype eq "DashBoard" || $tablestuff.Stufftype eq "ReportCharts"}
										<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-col slds-p-around_small"></div>
								{elseif $tablestuff.Stufftype eq "Default" && $tablestuff.Stufftitle eq $homepagedashboard_title}
										<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-col slds-p-around_small"></div>
								{elseif $tablestuff.Stufftype eq "Notebook" || $tablestuff.Stufftype eq "Tag Cloud"}
							<div id="maincont_row_{$tablestuff.Stuffid}" class="slds-col slds-p-around_small"></div>
					{else}
							<div id="maincont_row_{$tablestuff.Stuffid}" class="show_tab slds-col slds-p-around_small"></div>
					{/if}
							<div id="stuffcont_{$tablestuff.Stuffid}" class="slds-col slds-p-around_small"></div>
				</div>
					{if $tablestuff.Stufftype neq "Tag Cloud"}
						<div width="100%" cellpadding="0" cellspacing="0" class="slds-col slds-p-around_small scrollLink">
							{if $tablestuff.Stufftype eq "Module" || ($tablestuff.Stufftype eq "Default" && $tablestuff.Stufftitle neq "Key Metrics" && $tablestuff.Stufftitle neq $homepagedashboard_title && $tablestuff.Stufftitle neq "My Group Allocation" ) || $tablestuff.Stufftype eq "RSS" || $tablestuff.Stufftype eq "DashBoard"|| $tablestuff.Stufftype eq "ReportCharts"}
								<div class="slds-col slds-p-around_small">
									<a href="#" id="a_{$tablestuff.Stuffid}">
										{$MOD.LBL_MORE}
									</a>
								</div>
							{/if}
						</div>
					{/if}
				{*Widget footer content end*}
				</div>
			</div>
		</div>
	</div>
	{*<!-- Widget Item end -->*}

{*<!-- load contents for the widget-->*}
<script>
	{if $tablestuff.Stufftype eq 'Default' && $tablestuff.Stufftitle eq 'Home Page Dashboard'|@getTranslatedString:'Home'}
		fetch_homeDB({$tablestuff.Stuffid});
	{elseif $tablestuff.Stufftype eq 'DashBoard'}
		loadStuff({$tablestuff.Stuffid},'{$tablestuff.Stufftype}');
	{elseif $tablestuff.Stufftype eq 'ReportCharts'}
		loadStuff({$tablestuff.Stuffid},'{$tablestuff.Stufftype}');
	{/if}
</script>