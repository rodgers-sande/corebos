<?php
/*+********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
global $theme,$mod_strings,$current_language,$adb,$currentModule,$current_user,$app_strings;
$theme_path = 'themes/'.$theme.'/';
$image_path = $theme_path.'images/';

require_once 'modules/cbCalendar/calendarLayout.php';
require_once 'modules/Calendar4You/CalendarUtils.php';
require_once 'include/logging.php';
require_once 'include/utils/utils.php';
require_once 'modules/cbCalendar/CalendarCommon.php';
require_once 'modules/cbCalendar/Calendar.php';
$cal_log = LoggerManager::getLogger('calendar');
$cal_log->debug('> Calendar4YouAjax');

$mysel = isset($_REQUEST['view']) ? vtlib_purify($_REQUEST['view']) : 'day';
$calendar_arr = array();
$calendar_arr['IMAGE_PATH'] = $image_path;
$date_data = array();

if (isset($_REQUEST['day'])) {
	$date_data['day'] = vtlib_purify($_REQUEST['day']);
}
if (isset($_REQUEST['month'])) {
	$date_data['month'] = vtlib_purify($_REQUEST['month']);
}
if (isset($_REQUEST['week'])) {
	$date_data['week'] = vtlib_purify($_REQUEST['week']);
}
if (isset($_REQUEST['year'])) {
	if ($_REQUEST['year'] > 2037 || $_REQUEST['year'] < 1970) {
		print("<font color='red'>".$app_strings['LBL_CAL_LIMIT_MSG'].'</font>');
		exit;
	}
	$date_data['year'] = vtlib_purify($_REQUEST['year']);
}

if ((isset($_REQUEST['type']) && $_REQUEST['type'] !='') || (isset($_REQUEST['n_type']) && $_REQUEST['n_type'] !='')) {
	$type = (isset($_REQUEST['type']) ? vtlib_purify($_REQUEST['type']) : '');
	$n_type = (isset($_REQUEST['n_type']) ? vtlib_purify($_REQUEST['n_type']) : '');

	if ($type == 'minical') {
		$temp_module = $currentModule;
		$mod_strings = return_module_language($current_language, 'cbCalendar');
		$currentModule = 'Calendar';
		$calendar_arr['IMAGE_PATH'] = $image_path;
		$calendar_arr['calendar'] = new Calendar('month', $date_data);
		$calendar_arr['view'] = 'month';
		$calendar_arr['size'] = 'small';
		if ($current_user->hour_format != '') {
			$calendar_arr['calendar']->hour_format=$current_user->hour_format;
		}
		get_its_mini_calendar($calendar_arr);
		$mod_strings = return_module_language($current_language, $temp_module);
		$currentModule = vtlib_purify($_REQUEST['module']);
	} elseif ($type == 'settings') {
		require_once 'modules/Calendar4You/calendar_share.php';
	} elseif ($type == 'event_settings') {
		require_once 'modules/Calendar4You/event_settings.php';
	} else {
		$subtab = vtlib_purify($_REQUEST['subtab']);
		if (empty($mysel)) {
			$mysel = 'day';
		}
		$calendar_arr['calendar'] = new Calendar($mysel, $date_data);

		$calendar_arr['view'] = $mysel;
		if ($calendar_arr['calendar']->view == 'day') {
			$start_date = $end_date = $calendar_arr['calendar']->date_time->get_formatted_date();
		} elseif ($calendar_arr['calendar']->view == 'week') {
			$start_date = $calendar_arr['calendar']->slices[0];
			$end_date = $calendar_arr['calendar']->slices[6];
		} elseif ($calendar_arr['calendar']->view == 'month') {
			$start_date = $calendar_arr['calendar']->date_time->getThismonthDaysbyIndex(0);
			$end_date = $calendar_arr['calendar']->date_time->getThismonthDaysbyIndex($calendar_arr['calendar']->date_time->daysinmonth - 1);
			$start_date = $start_date->get_formatted_date();
			$end_date = $end_date->get_formatted_date();
		} elseif ($calendar_arr['calendar']->view == 'year') {
			$start_date = $calendar_arr['calendar']->date_time->getThisyearMonthsbyIndex(0);
			$end_date = $calendar_arr['calendar']->date_time->get_first_day_of_changed_year('increment');
			$start_date = $start_date->get_formatted_date();
			$end_date = $end_date->get_formatted_date();
		} else {
			die('view:'.$calendar_arr['calendar']->view.' is not defined');
		}

		if ($type == 'activity_delete' || $type == 'activity_postpone' || $n_type == 'nav') {
			if ($current_user->hour_format != '') {
				$calendar_arr['calendar']->hour_format=$current_user->hour_format;
			}

			if ($_REQUEST['viewOption'] == 'hourview' && ($mysel == 'day' || $mysel == 'week' || $mysel == 'month' || $mysel == 'year')) {
				$calendar_arr['calendar']->add_Activities($current_user);
			}

			if (isset($_REQUEST['viewOption']) && $_REQUEST['viewOption'] != null && $subtab == 'event') {
				if ($_REQUEST['viewOption'] == 'hourview') {
					if ($calendar_arr['view'] == 'day') {
						echo getDayViewLayout($calendar_arr).'####'.getEventInfo($calendar_arr, 'listcnt');
					} elseif ($calendar_arr['view'] == 'week') {
						echo getWeekViewLayout($calendar_arr).'####'.getEventInfo($calendar_arr, 'listcnt');
					} elseif ($calendar_arr['view'] == 'month') {
						echo getMonthViewLayout($calendar_arr).'####'.getEventInfo($calendar_arr, 'listcnt');
					} elseif ($calendar_arr['view'] == 'year') {
						echo getYearViewLayout($calendar_arr).'####'.getEventInfo($calendar_arr, 'listcnt');
					} else {
						die('view:'.$view['view'].' is not defined');
					}
				} elseif ($_REQUEST['viewOption'] == 'listview') {
					//To get Events List
					$activity_arr = getEventList($calendar_arr, $start_date, $end_date);
					$activity_list = $activity_arr[0];
					$navigation_arr = $activity_arr[1];
					echo constructEventListView($calendar_arr, $activity_list, $navigation_arr).'####'.getEventInfo($calendar_arr, 'listcnt');
				}
			} elseif ($subtab == 'todo') {
				//To get Todos List
				$todo_arr = getTodoList($calendar_arr, $start_date, $end_date);
				$todo_list = $todo_arr[0];
				$navigation_arr = $todo_arr[1];
				echo constructTodoListView($todo_list, $calendar_arr, $subtab, $navigation_arr).'####'.getTodoInfo($calendar_arr, 'listcnt');
			}
		} elseif ($type == 'view') {
			checkFileAccessForInclusion('modules/Calendar/'.$_REQUEST['file'].'.php');
			require_once 'modules/Calendar/'.$_REQUEST['file'].'.php';
		} else {
			die('View option is not defined');
		}
	}
} else {
	require_once 'include/Ajax/CommonAjax.php';
}
?>
