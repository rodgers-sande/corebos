function fieldDep_AddDays(change_field, action_field, new_value, old_value, parameters) {
	var datesep = '-';
	if (new_value.indexOf('-')>=0) {
		datesep='-';
	} else if (new_value.indexOf('.')>=0) {
		datesep='.';
	} else if (new_value.indexOf('/')>=0) {
		datesep='/';
	}
	var date=splitDateVal(new_value);
	var dd = parseInt(date[0]);
	var mm = parseInt(date[1]);
	var y = parseInt(date[2]);
	var currDate=new Date();
	currDate.setFullYear(y);
	currDate.setMonth(mm-1);
	currDate.setDate(dd);
	currDate.setDate(currDate.getDate() + parseInt(parameters[0]));
	dd = currDate.getDate();
	dd = (dd>9 ? '' : '0') + dd;
	mm = currDate.getMonth() + 1;
	mm = (mm>9 ? '' : '0') + mm;
	y = currDate.getFullYear();
	var fulldate = '';
	switch (userDateFormat) {
	case 'mm-dd-yyyy':
		fulldate = mm+datesep+dd+datesep+y;
		break;
	case 'dd-mm-yyyy':
		fulldate = dd+datesep+mm+datesep+y;
		break;
	case 'yyyy-mm-dd':
		fulldate = y+datesep+mm+datesep+dd;
		break;
	}
	document.getElementsByName(action_field).item(0).value=fulldate;
}

function fieldDep_SubDays(change_field, action_field, new_value, old_value, parameters) {
	parameters[0] = -1*parseInt(parameters[0]);
	fieldDep_AddDays(change_field, action_field, new_value, old_value, parameters);
}

function fieldDep_OnlyNumbers(change_field, action_field, new_value, old_value, parameters) {
	document.getElementsByName(action_field).item(0).value = new_value.replace(/\D/g, '');
}

function fieldDep_OnlyLetters(change_field, action_field, new_value, old_value, parameters) {
	document.getElementsByClassName(action_field).item(0).value = new_value.replace(/[^A-Za-z]/g, '');
}

function fieldDep_GetField(change_field, action_field, new_value, old_value, parameters) {
	ExecuteFunctions('getFieldValuesFromRecord', 'getFieldValuesFrom='+new_value+'&getTheseFields='+parameters[0]).then(function (data) {
		let rdo = JSON.parse(data);
		let srcfieldids = parameters[0].split(',');
		let dstfieldids = parameters[1].split(',');
		for (var f=0; f<srcfieldids.length; f++) {
			if (CKEDITOR.instances[dstfieldids[f]]!=undefined) {
				let fld = CKEDITOR.instances[dstfieldids[f]];
				fld.insertHtml(rdo[srcfieldids[f]]);
			} else {
				let fld = document.getElementById(dstfieldids[f]);
				if (fld) {
					fld.value = rdo[srcfieldids[f]];
				}
			}
		}
	});
}

function fieldDep_AssignNewValue(change_field, action_field, new_value, old_value, parameters) {
	document.getElementsByName(action_field).item(0).value = new_value;
}

function fieldDep_AssignUser(change_field, action_field, new_value, old_value, parameters) {
	document.querySelector('input[name="assigntype"][value="U"]').checked=true;
	document.querySelector('input[name="assigntype"][value="T"]').checked=false;
	toggleAssignType('U');
	document.getElementById('assigned_user_id').value = (parameters[0]=='gVTUserID' ? gVTUserID : parameters[0]);
}

function fieldDep_AssignGroup(change_field, action_field, new_value, old_value, parameters) {
	document.querySelector('input[name="assigntype"][value="U"]').checked=false;
	document.querySelector('input[name="assigntype"][value="T"]').checked=true;
	toggleAssignType('T');
	document.getElementById('assigned_group_id').value = parameters[0];
}

function fieldDep_AssignUserSelect(change_field, action_field, new_value, old_value, parameters) {
	let newuser = (parameters[0]=='gVTUserID' ? gVTUserID : parameters[0]);
	ExecuteFunctions('getUserName', 'userid='+newuser).then(function (data) {
		let rdo = JSON.parse(data);
		document.getElementById(action_field+'_display').value = rdo;
	});
	document.getElementById(action_field).value = newuser;
}

function fieldDep_Format(change_field, action_field, new_value, old_value, parameters) {
}

function fieldDep_ChangeLabel(change_field, action_field, new_value, old_value, parameters) {
}
