﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.png">
<link rel="icon" href="images/favicon.png">
<title>Mod New Account</title>
<link rel="stylesheet" href="../form_style.css"  type="text/css">

<script type="text/javascript" src="../state.js"></script>
<script type="text/javascript">
var selectedAccount = parent.getSelectedAccount();

function initial(){
	$("new_account").value = decodeURIComponent(selectedAccount);
	
	showtext($("selected_account"), decodeURIComponent(selectedAccount));
	
	clickevent();
}

function clickevent(){
	$("Submit").onclick = function(){
			if(validForm()){
				$("account").value = decodeURIComponent(selectedAccount);
				
				parent.showLoading();
				document.modifyAccountForm.submit();
				parent.hidePop("apply");
			}
		};
}

function checkDuplicateName(newname, teststr){
	var existing_string = decodeURIComponent(teststr.join(','));
	existing_string = "," + existing_string + ",";
	var newstr = "," + trim(newname) + ","; 

	var re = new RegExp(newstr,"gi")
	var matchArray =  existing_string.match(re);
	if (matchArray != null)
		return true;
	else
		return false;
}

function validForm(){
	showtext($("alert_msg1"), "");
	showtext($("alert_msg2"), "");

	// new_account name
	if($("new_account").value.length > 0){
		var alert_str = validate_account($("new_account"), "noalert");

		if(alert_str != ""){
			showtext($("alert_msg1"), alert_str);
			$("new_account").focus();
			return false;
		}

		$("new_account").value = trim($("new_account").value);

		if($("account").value.length == 0){
			showtext($("alert_msg1"), "<#File_Pop_content_alert_desc1#>");
			$("account").focus();
			return false;
		}
		
		if($("new_account").value == "root"
				|| $("new_account").value == "guest"
				|| $("new_account").value == "anonymous"
				){
			showtext($("alert_msg1"), "<#USB_Application_account_alert#>");
			$("new_account").focus();
			return false;
		}

		if($("new_account").value.length <= 1){
			showtext($("alert_msg1"), "<#File_Pop_content_alert_desc2#>");
			$("new_account").focus();
			return false;
		}

		if($("new_account").value.length > 20){
			showtext($("alert_msg1"), "<#File_Pop_content_alert_desc3#>");
			$("new_account").focus();
			return false;
		}

		if(checkDuplicateName($("new_account").value, parent.get_accounts()) &&
				$("new_account").value != decodeURIComponent(selectedAccount)){
			showtext($("alert_msg1"), "<#File_Pop_content_alert_desc5#>");
			$("new_account").focus();
			return false;
		}
	}

	// password
	if($("new_password").value.length <= 0 || $("confirm_password").value.length <= 0){
		showtext($("alert_msg2"),"*<#File_Pop_content_alert_desc6#>");
		if($("new_password").value.length <= 0){
				$("new_password").focus();
				$("new_password").select();
		}else{
				$("confirm_password").focus();
				$("confirm_password").select();
		}
		return false;
	}

	if($("new_password").value != $("confirm_password").value){
		showtext($("alert_msg2"),"*<#File_Pop_content_alert_desc7#>");
		$("confirm_password").focus();
		return false;
	}

	if(!validate_string(document.modifyAccountForm.new_password)){
			$("new_password").focus();
			$("new_password").select();
			return false;
	}

	if($("new_password").value.length > 16){
			showtext($("alert_msg2"),"*<#LANHostConfig_x_Password_itemdesc#>");
			$("password").focus();
			$("password").select();
			return false;
	}

	return true;
}
</script>
</head>

<body onLoad="initial();">
<form method="post" name="modifyAccountForm" action="modify_account.asp" target="hidden_frame">
<input name="account" id="account" type="hidden" value="">
	<table width="90%" class="popTable" border="0" align="center" cellpadding="0" cellspacing="0">
	<thead>
    <tr>
      <td colspan="2"><span style="color:#FFF"><#ModAccountTitle#>: </span><span style="color:#FFF" id="selected_account"></span><img src="../images/button-close.gif" onClick="parent.hidePop('OverlayMask');"></td>
    </tr>
    </thead>	
	<tbody>
    <tr valign="middle">
      <td height="30" colspan="2" class="hint_word"><#ModAccountAlert#></td>
    </tr>
    <tr>
      <th><#AiDisk_Account#>: </th>
      <td><input class="input_15_table" name="new_account" id="new_account" type="text" maxlength="20">
      		<br/><span id="alert_msg1"></span>	
      </td>
    </tr>
    <tr>
      <th><#ModAccountPassword#>: </th>
      <td><input type="password" class="input_15_table" autocapitalization="off" name="new_password" id="new_password" onKeyPress="return is_string(this, event);" maxlength="17"></td>
    </tr>
    <tr>
      <th><#Confirmpassword#>: </th>
      <td><input type="password" class="input_15_table" autocapitalization="off" name="confirm_password" id="confirm_password" onKeyPress="return is_string(this, event);" maxlength="17">
      		<br/><span id="alert_msg2"></span>	
      </td>
    </tr>
	</tbody>	
    <tr bgcolor="#E6E6E6">
      <th colspan="2" align="right"><input id="Submit" type="button" class="button_gen" value="<#CTL_modify#>"></th>
    </tr>
  </table>
</form>
</body>
</html>
