<script src="include/gridstack.js" type="text/javascript"></script>
<script src="include/dashboardcb.js" type="text/javascript"></script>
<script src="include/gridstack.jQueryUI.js" type="text/javascript"></script>
<link rel="stylesheet" href="include/gridstack.css" type="text/css">
<link rel="stylesheet" href="include/gridstack-extra.css" type="text/css">

{*<!-- Dashboard Widgets Panel -->*}
<div class="grid-stack" data-gs-animate="yes">
	{*<!-- Widget Item begin -->*}
	<div class="grid-stack-item slds-m-around_x-small" data-gs-width="4" data-gs-height="4">
		<div class="grid-stack-item-content dash-item-bg-light dash-decor-1">
			<div class="slds-grid slds-grid_vertical">
				{*<!-- Widget header begin -->*}
				<div class="slds-col slds-p-around_small">
					<div class="slds-page-header slds-page-header_related-list slds-p-vertical_xx-small">
						<div class="slds-page-header__row slds-grid_vertical-align-center widgetcard_header" onmouseleave="expandoptionshide()">
							<div class="slds-page-header__col-title">
								<div class="slds-media">
									<div class="slds-media__body">
									<div class="slds-page-header__name">
										<div class="slds-page-header__name-title">
										<div class="slds-text-heading_small">
											<h6 class="slds-text-heading_small slds-page-header__title slds-truncate" title="Contacts (will truncate)">Title (will truncate)</h6>
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
													<li class="slds-p-around_xx-small">
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
													<li class="slds-p-around_xx-small">
														<button class="slds-button">
															<span class="slds-icon_container slds-icon-utility-edit" title="{$APP.LBL_EDIT_BUTTON}">
																<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
																	<use xmlns:xlink="http://www.w3.org/1999/xlink"
																		xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#edit" />
																</svg>
																<span class="slds-assistive-text">{$APP.LBL_EDIT_BUTTON}</span>
															</span>
														</button>
													</li>
												</ul>
											</li>
											<li class="gridclose_icon slds-p-around_xx-small">
												<button class="slds-button">
													<span class="slds-icon_container slds-icon-utility-close" title="{'LBL_CLOSE'|@getTranslatedString}">
														<svg class="slds-icon slds-icon_x-small slds-icon-text-default" aria-hidden="true">
															<use xmlns:xlink="http://www.w3.org/1999/xlink"
																xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#close" />
														</svg>
														<span class="slds-assistive-text">{'LBL_CLOSE'|@getTranslatedString}</span>
													</span>
												</button>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				{*<!-- Widget header end -->*}
				{*<!-- Widget items begin -->*}
				<div class="slds-col slds-p-around_small">
					Widget Content here
				</div>
				{*<!-- Widget items end -->*}
			</div>
		</div>
	</div>
	{*<!-- Widget Item end -->*}
</div>
{*<!-- Dashboard Widget Panel End -->*}

{*Expand options menu*}

<script type="text/javascript">
var gridcols = GridStack.init({
	compact: true,
	resizable: {
		handles: 'e, se, s, sw, w'
	}
});

gridcols();
</script>