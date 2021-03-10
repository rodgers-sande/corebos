<div class='hide_tab' id="editRowmodrss_{$HOME_STUFFID}">
	{if $HOME_STUFFTYPE eq "Module" || $HOME_STUFFTYPE eq "RSS" || $HOME_STUFFTYPE eq "Default"}
		<div class="slds-grid slds-grid_vertical slds-p-around_xx-small">
			<div class="slds-col">
				<div class="slds-form-element">
					<label class="slds-form-element__label" for="maxentries_{$HOME_STUFFID}" id="fixed-text-label">{$MOD.LBL_HOME_SHOW}</label>
					<div class="slds-form-element__control slds-input-has-fixed-addon">
						<select id="maxentries_{$HOME_STUFFID}" name="maxid" class="slds-select">
							{section name=iter start=1 loop=13 step=1}
								<option value="{$smarty.section.iter.index}" {if $HOME_STUFF.Maxentries==$smarty.section.iter.index} selected {/if}>
									{$smarty.section.iter.index}
								</option>
							{/section}
						</select>
					<span class="slds-form-element__addon" id="fixed-text-addon-post">{$MOD.LBL_HOME_ITEMS}</span>
					</div>
				</div>
			</div>
			<div class="slds-col slds-p-around_xx-small">
				<div class="slds-page-header__control">
					<ul class="slds-button-group-list">
						<li>
							<button class="slds-button slds-button_success" onclick="saveEntries('maxentries_{$HOME_STUFFID}')"> {$APP.LBL_SAVE_BUTTON_LABEL} </button>
						</li>
						<li>
							<button class="slds-button slds-button_destructive" onclick="cancelEntries('editRowmodrss_{$HOME_STUFFID}')" > {$APP.LBL_CANCEL_BUTTON_LABEL} </button>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="slds-col">
			{if $HOME_STUFFTYPE eq 'Module'}
			{$HOME_STUFF.ModuleName|@getTranslatedString:$HOME_STUFF.ModuleName}::{$HOME_STUFF.cvidname|@getTranslatedString:$HOME_STUFF.ModuleName}
			{/if}
		</div>
{elseif $HOME_STUFFTYPE eq "DashBoard"}
		<div class="slds-grid slds-grid_vertical slds-p-around_xx-small">
		<fieldset class="slds-form-element">
			<div class="slds-form-element__control">
			<span class="slds-radio">
				<input type="radio" id="dashradio_0" name="dashradio_{$HOME_STUFFID}" value="horizontalbarchart" {if $DASHDETAILS.$HOME_STUFFID.Chart eq 'horizontalbarchart'}checked{/if}>
				<label class="slds-radio__label" for="dashradio_0">
				<span class="slds-radio_faux"></span>
				<span class="slds-form-element__label">{'LBL_HOME_HORIZONTAL'|@getTranslatedString:'Home'}</span>
				</label>
			</span>
			<span class="slds-radio">
				<input type="radio" id="dashradio_1" name="dashradio_{$HOME_STUFFID}" value="verticalbarchart"{if $DASHDETAILS.$HOME_STUFFID.Chart eq 'verticalbarchart'}checked{/if}>
				<label class="slds-radio__label" for="dashradio_1">
				<span class="slds-radio_faux"></span>
				<span class="slds-form-element__label">{'LBL_HOME_VERTICAL'|@getTranslatedString:'Home'}</span>
				</label>
			</span>
			<span class="slds-radio">
				<input type="radio" id="dashradio_2" name="dashradio_{$HOME_STUFFID}" value="piechart" {if $DASHDETAILS.$HOME_STUFFID.Chart eq 'piechart'}checked{/if}>
				<label class="slds-radio__label" for="dashradio_2">
				<span class="slds-radio_faux"></span>
				<span class="slds-form-element__label">{'LBL_HOME_PIE'|@getTranslatedString:'Home'}</span>
				</label>
			</span>
			</div>
		</fieldset>
		<div class="slds-col slds-p-around_xx-small">
			<div class="slds-page-header__control">
				<ul class="slds-button-group-list">
					<li>
						<button class="slds-button slds-button_success" onclick="saveEditDash({$HOME_STUFFID})"> {$APP.LBL_SAVE_BUTTON_TITLE} </button>
					</li>
					<li>
						<button class="slds-button slds-button_destructive" onclick="cancelEntries('editRowmodrss_{$HOME_STUFFID}')" > {$APP.LBL_CANCEL_BUTTON_LABEL} </button>
					</li>
				</ul>
			</div>
		</div>
		</div>
		{elseif $HOME_STUFFTYPE eq "ReportCharts"}
		<div class="slds-grid slds-grid_vertical slds-p-around_xx-small">
			<div class="slds-col">
				<fieldset class="slds-form-element">
					<div class="slds-form-element__control">
					<span class="slds-radio">
						<input type="radio" id="reportradio_{$HOME_STUFFID}_0" name="reportradio_{$HOME_STUFFID}" value="horizontalbarchart" {if $DASHDETAILS.$HOME_STUFFID.Chart eq 'horizontalbarchart'}checked{/if} onclick="changeGraphType({$HOME_STUFFID},'horizontalbarchart');">
						<label class="slds-radio__label" for="reportradio_{$HOME_STUFFID}_0">
						<span class="slds-radio_faux"></span>
						<span class="slds-form-element__label">{'LBL_HOME_HORIZONTAL'|@getTranslatedString:'Home'}</span>
						</label>
					</span>
					<span class="slds-radio">
						<input type="radio" id="reportradio_{$HOME_STUFFID}_1" name="reportradio_{$HOME_STUFFID}" value="verticalbarchart"{if $DASHDETAILS.$HOME_STUFFID.Chart eq 'verticalbarchart'}checked{/if} onclick="changeGraphType({$HOME_STUFFID},'verticalbarchart');">
						<label class="slds-radio__label" for="reportradio_{$HOME_STUFFID}_1">
						<span class="slds-radio_faux"></span>
						<span class="slds-form-element__label">{'LBL_HOME_VERTICAL'|@getTranslatedString:'Home'}</span>
						</label>
					</span>
					<span class="slds-radio">
						<input type="radio" id="reportradio_{$HOME_STUFFID}_2" name="reportradio_{$HOME_STUFFID}" value="piechart" {if $DASHDETAILS.$HOME_STUFFID.Chart eq 'piechart'}checked{/if} onclick="changeGraphType({$HOME_STUFFID},'piechart');">
						<label class="slds-radio__label" for="reportradio_{$HOME_STUFFID}_2">
						<span class="slds-radio_faux"></span>
						<span class="slds-form-element__label">{'LBL_HOME_PIE'|@getTranslatedString:'Home'}</span>
						</label>
					</span>
					</div>
				</fieldset>
			</div>
			<div class="slds-col slds-p-around_xx-small">
				<div class="slds-page-header__control">
					<ul class="slds-button-group-list">
						<li>
							<button class="slds-button slds-button_success"  onclick="saveEditReportCharts({$HOME_STUFFID})"> {$APP.LBL_SAVE_BUTTON_TITLE} </button>
						</li>
						<li>
							<button class="slds-button slds-button_destructive" onclick="cancelEntries('editRowmodrss_{$HOME_STUFFID}')" > {$APP.LBL_CANCEL_BUTTON_LABEL} </button>
						</li>
					</ul>
				</div>
			</div>
		</div>
		{/if}
</div>

<input type=hidden id="test_{$HOME_STUFFID}" value={$HOME_STUFFTYPE}/>
{if $HOME_STUFFTYPE eq "Module"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{$HOME_STUFF.ModuleName}"/>
	<input type=hidden id=cvid_{$HOME_STUFFID} value="{$HOME_STUFF.cvid}">
	<table cellspacing=0 cellpadding=2 width=60% class='slds-table slds-table_header-hidden slds-table_bordered slds-table_edit slds-tree slds-table_tree' aria-multiselectable=true role="treegrid">
	{assign var='cvid' value=$HOME_STUFF.cvid}
	{assign var='modulename' value=$HOME_STUFF.ModuleName}
	<thead>
		<tr class="slds-line-height_reset">
			<td width=5%>
				&nbsp;
			</td>
			{foreach item=header from=$HOME_STUFF.Header}
			<th aria-label="{$header}" aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
				<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
					<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
					<span class="slds-truncate" title="{$header}">{$header}</span>
					<span class="slds-icon_container slds-icon-utility-arrowdown">
						<svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
						<use xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown"></use>
						</svg>
					</span>
					</div>
				</a>
			</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>
	{if $HOME_STUFF.Entries|@count > 0}
		{foreach item=row key=crmid from=$HOME_STUFF.Entries}
 	<tr aria-level="1" aria-posinset="1" aria-selected="false" aria-setsize="4" class="slds-hint-parent" tabindex="0">
		<td class="slds-text-align_left slds-truncate" role="gridcell">
			<a href="index.php?module={$HOME_STUFF.ModuleName}&action=DetailView&record={$crmid}">
				<img src="{'bookMark.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0" alt="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}" title="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}"/>
			</a>
		</td>
			{foreach item=element from=$row}
		<td class="slds-text-align_left" role="gridcell">
			{$element}
		</td>
			{/foreach}
	</tr>
		{/foreach}
	{else}
		<div class="componentName">{$APP.LBL_NO_DATA}</div>
	{/if}
	</tbody>
	</table>
{elseif $HOME_STUFFTYPE eq "CustomWidget"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{$HOME_STUFF.ModuleName}"/>
	<input type=hidden id=cvid_{$HOME_STUFFID} value="{$HOME_STUFF.cvid}">
	<table cellspacing=0 cellpadding=2 width=100% class='slds-table slds-table_header-hidden slds-table_bordered slds-table_edit slds-tree slds-table_tree' aria-multiselectable=true role="treegrid">
	{assign var='cvid' value=$HOME_STUFF.cvid}
	{assign var='modulename' value=$HOME_STUFF.ModuleName}
	<thead>
		<tr aria-level="1" aria-posinset="1" aria-selected="false" aria-setsize="4" class="slds-hint-parent" tabindex="0">
			<td width=4% class="slds-text-align_left slds-truncate" role="gridcell">
				&nbsp;
			</td>
			{foreach item=header from=$HOME_STUFF.Header}
			<th aria-label="{$header}" aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
				<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
					<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
					<span class="slds-truncate" title="{$header}">{$header}</span>
					<span class="slds-icon_container slds-icon-utility-arrowdown">
						<svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
						<use xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown"></use>
						</svg>
					</span>
					</div>
				</a>
			</th>
			{/foreach}
		</tr>
	</thead>
	<tbody>
		{foreach item=row key=crmid from=$HOME_STUFF.Entries}
		<tr aria-level="1" aria-posinset="1" aria-selected="false" aria-setsize="4" class="slds-hint-parent" tabindex="0">
			<td width=4% class="slds-text-align_left slds-truncate" role="gridcell">
				&nbsp;
			</td>
			{foreach item=element from=$row name=aggrow}
			<td {if $smarty.foreach.aggrow.last}style="text-align: right;"{/if} nowrap width=40% class="slds-text-align_left slds-truncate" role="gridcell">
				{$element}
			</td>
			{/foreach}
		</tr>
		{/foreach}
	</tbody>
	</table>

{elseif $HOME_STUFFTYPE eq "Default"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{if isset($HOME_STUFF.Details.ModuleName)}{$HOME_STUFF.Details.ModuleName}{/if}"/>
	{if is_array($HOME_STUFF.Details.Entries) && $HOME_STUFF.Details.Entries|@count > 0}
		<table cellspacing=0 cellpadding=2 width=100% class='slds-table slds-table_header-hidden slds-table_bordered slds-table_edit slds-tree slds-table_tree' aria-multiselectable=true role="treegrid">
		<thead>
		<tr class="slds-line-height_reset">
			<td width=5%>
				&nbsp;
			</td>
			{foreach item=header from=$HOME_STUFF.Details.Header}
			<th aria-label="{$header}" aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
				<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
					<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
					<span class="slds-truncate" title="{$header}">{$header}</span>
					<span class="slds-icon_container slds-icon-utility-arrowdown">
						<svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
						<use xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown"></use>
						</svg>
					</span>
					</div>
				</a>
			</th>
			{/foreach}
		</tr>
	</thead>
		{foreach item=row key=crmid from=$HOME_STUFF.Details.Entries}
			<tr>
				<td class="slds-text-align_left slds-truncate" role="gridcell">
				{if isset($HOME_STUFF.Details.Title)}
					{if $HOME_STUFF.Details.Title.1 eq "My Sites"}
					<img src="{'bookMark.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0" alt="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}" title="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}"/>
					{elseif $HOME_STUFF.Details.Title.1 neq "Key Metrics" && $HOME_STUFF.Details.Title.1 neq "My Group Allocation"}
					<img src="{'bookMark.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0" alt="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}" title="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}"/>
					{elseif $HOME_STUFF.Details.Title.1 eq "Key Metrics"}
					<img src="{'bookMark.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0" alt="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}" title="{$APP.LBL_MORE} {$APP.LBL_INFORMATION} "/>
					{elseif $HOME_STUFF.Details.Title.1 eq "My Group Allocation"}
					<img src="{'bookMark.gif'|@vtiger_imageurl:$THEME}" align="absmiddle" border="0" alt="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}" title="{$APP.LBL_MORE} {$APP.LBL_INFORMATION}"/>
					{/if}
				{/if}
				</td>
				{foreach item=element from=$row}
				<td class="slds-text-align_left slds-truncate" role="gridcell"> {$element}</td>
				{/foreach}
			</tr>
		{/foreach}
	{else}
		<div class="componentName">{$APP.LBL_NO_DATA}</div>
	{/if}
	</table>

{elseif $HOME_STUFFTYPE eq "RSS"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{$HOME_STUFF.Entries.More}"/>
	<table cellspacing=0 cellpadding=2 width=100% class='slds-table slds-table_header-hidden slds-table_bordered slds-table_edit slds-tree slds-table_tree' aria-multiselectable=true role="treegrid">
		{foreach item="details" from=$HOME_STUFF.Entries.Details}
			<tr>
				<td class="slds-text-align_left slds-truncate" role="gridcell">
					<a href="{$details.1}" target="_blank">
						{$details.0|truncate:50}...
					</a>
				</td>
			</tr>
		{/foreach}
	</table>

{elseif $HOME_STUFFTYPE eq "DashBoard"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{$DASHDETAILS[$HOME_STUFFID].DashType}"/>
	<table cellspacing=0 cellpadding=5 width=100% class='slds-table slds-table_header-hidden slds-table_bordered slds-table_edit slds-tree slds-table_tree' aria-multiselectable=true role="treegrid">
		<tr>
			<td class="slds-text-align_left slds-truncate" role="gridcell">{$HOME_STUFF}</td>
		</tr>
	</table>
{elseif $HOME_STUFFTYPE eq 'ReportCharts' && isset($HOME_STUFF.error)}
	{$HOME_STUFF.error}
{elseif $HOME_STUFFTYPE eq "ReportCharts"}
	<input type=hidden id=more_{$HOME_STUFFID} value="{$DASHDETAILS[$HOME_STUFFID].ReportId}"/>
	<table cellspacing=0 cellpadding=5 width=100%>
		<tr>
			<td class="slds-text-align_left slds-truncate" role="gridcell">
			<canvas id="homechart{$HOME_STUFFID}" style="width:500px;height:250px;margin:auto;padding:10px;"></canvas>
<script type="text/javascript">
window.doChart{$HOME_STUFFID} = function(charttype) {ldelim}
	let stuffchart = document.getElementById('homechart{$HOME_STUFFID}');
	let stuffcontext = stuffchart.getContext('2d');
	stuffcontext.clearRect(0, 0, stuffchart.width, stuffchart.height);
{literal}
	let chartDataObject = {
		labels: [{/literal}{foreach item=LABEL name=chartlabels from=$HOME_STUFF.xaxisData}"{$LABEL}"{if not $smarty.foreach.chartlabels.last},{/if}{/foreach}{literal}],
		datasets: [{
			data: [{/literal}{foreach item=CVALUE name=chartvalues from=$HOME_STUFF.yaxisData}"{$CVALUE}"{if not $smarty.foreach.chartvalues.last},{/if}{/foreach}{literal}]
		}]
	};
	const arrSum = chartDataObject.datasets[0].data.reduce((a,b) => Number(a) + Number(b), 0);
	const maxnum = Math.max.apply(Math, chartDataObject.datasets[0].data);
	const maxgrph = Math.ceil(maxnum + (6 * maxnum / 100));
	Chart.scaleService.updateScaleDefaults('linear', {
		ticks: {
			min: 0,
			max: maxgrph,
			precision: 0
		}
	});{/literal}
	{if !empty($GRAPHCOLORSCHEME) && $DASHDETAILS.$HOME_STUFFID.Chart neq 'piechart'}
	chartDataObject.datasets[0].backgroundColor = Chart['colorschemes'].{$GRAPHCOLORSCHEME};
	{/if}
	window.schart{$HOME_STUFFID} = new Chart(stuffchart,{
		type: charttype,
		data: chartDataObject,
		options: {
			plugins: {
				{if !empty($GRAPHCOLORSCHEME) && $DASHDETAILS.$HOME_STUFFID.Chart eq 'piechart'}
				colorschemes: {
					scheme: '{$GRAPHCOLORSCHEME}'
				},
				{/if}
				datalabels: {
					{if $GRAPHSHOW=='None'}
					display: false,
					{/if}
					color: '{$GRAPHSHOWCOLOR}',
					font: {
						size: 14,
						weight: 'bold'
					},
					{if $GRAPHSHOW=='Percentage' || $GRAPHSHOW=='ValuePercentage'}
					formatter: function(value, context) {
						{if $GRAPHSHOW=='ValuePercentage'}
						return value + ' (' + Math.round(value*100/arrSum) + '%)';
						{else}
						return Math.round(value*100/arrSum) + '%';
						{/if}
					}
					{/if}{literal}
				}
			},
			responsive: true,
			legend: {
				position: 'right',
				display: (charttype=='pie'),
				labels: {
					fontSize: 11,
					boxWidth: 18
				}
			}
		}
	});
	stuffchart.addEventListener('click',function(evt) {
		let activePoint = schart{/literal}{$HOME_STUFFID}{literal}.getElementAtEvent(evt);
		let clickzone = {
			{/literal}{foreach item=CLICKVALUE key=CLICKINDEX name=clickvalues from=$HOME_STUFF.targetLink}{$CLICKINDEX}:"{$CLICKVALUE}"{if not $smarty.foreach.clickvalues.last},{/if}{/foreach}{literal}
		};
		let a = document.createElement("a");
		a.target = "_blank";
		a.href = clickzone[activePoint[0]._index];
		document.body.appendChild(a);
		a.click();
	});
}
{/literal}
{if $DASHDETAILS.$HOME_STUFFID.Chart eq 'horizontalbarchart'}
let charttype = 'horizontalBar';
{elseif $DASHDETAILS.$HOME_STUFFID.Chart eq 'verticalbarchart'}
let charttype = 'bar';
{elseif $DASHDETAILS.$HOME_STUFFID.Chart eq 'piechart'}
let charttype = 'pie';
{else}
let charttype = 'verticalbarchart';
{/if}
doChart{$HOME_STUFFID}(charttype);
</script>
			</td>
		</tr>
	</table>
{/if}
{if isset($HOME_STUFF.Details) && $HOME_STUFF.Details|@is_array == 'true'}
<input id='search_qry_{$HOME_STUFFID}' name='search_qry_{$HOME_STUFFID}' type='hidden' value='{if isset($HOME_STUFF.Details.search_qry)}{$HOME_STUFF.Details.search_qry}{/if}' />
{/if}
