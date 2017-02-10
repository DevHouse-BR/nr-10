<?php
/**
* @version $Id: mod_login.php 5866 2006-11-28 01:13:26Z friesengeist $
* @package Joomla
* @copyright Copyright (C) 2005 Open Source Matters. All rights reserved.
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined( '_VALID_MOS' ) or die( 'Restricted access' );

global $mosConfig_frontend_login;

if ( $mosConfig_frontend_login != NULL && ($mosConfig_frontend_login === 0 || $mosConfig_frontend_login === '0')) {
	return;
}

// url of current page that user will be returned to after login
if ($query_string = mosGetParam( $_SERVER, 'QUERY_STRING', '' )) {
	$return = 'index.php?' . $query_string;
} else {
	$return = 'index.php';
}
// converts & to &amp; for xtml compliance
$return 				= str_replace( '&', '&amp;', $return );

if($mainframe->getCfg( 'allowUserRegistration' ) && $params->get( 'registration' )) {
	$registration_enabled 	= 1;
} else {
	$registration_enabled 	= 0;
}
$message_login 			= $params->def( 'login_message', 	0 );
$message_logout 		= $params->def( 'logout_message', 	0 );
$login 					= $params->def( 'login', 			$return );
$logout 				= $params->def( 'logout', 			$return );
$name 					= $params->def( 'name', 			1 );
$greeting 				= $params->def( 'greeting', 		1 );
$pretext 				= $params->get( 'pretext' );
$posttext 				= $params->get( 'posttext' );
$text_in				= $params->get( 'text_in' );
$login_button			= $params->get( 'login_button' );
$logout_button			= $params->get( 'logout_button' );
$auto_remember			= $params->get( 'auto_remember' );
$lostpassword 			= $params->get( 'lost_password' );

if ( $my->id ) {
// Logout output
// ie HTML when already logged in and trying to logout
	if ( $name ) {
		$name = $my->name;
	} else {
		$name = $my->username;
	}	
	?>
	
	<div id="yt-logout">
	
		<form action="<?php echo sefRelToAbs( 'index.php?option=logout' ); ?>" method="post" name="logoutForm">	
		<?php if ( $greeting ) { ?>
		<div class="yt-greeting">
			<?php echo _HI; ?>
			<?php echo $name; ?>
		</div>
		<?php }	?>
	
		<div class="yt-logout-button">
			<button value="<?php if ( !$logout_button ) { echo _BUTTON_LOGOUT; } ?>" name="Submit" type="submit"><?php if ( !$logout_button ) { echo _BUTTON_LOGOUT; } ?></button>
		</div>
	
		<input type="hidden" name="option" value="logout" />
		<input type="hidden" name="op2" value="logout" />
		<input type="hidden" name="lang" value="<?php echo $mosConfig_lang; ?>" />
		<input type="hidden" name="return" value="<?php echo sefRelToAbs( $logout ); ?>" />
		<input type="hidden" name="message" value="<?php echo $message_logout; ?>" />
		</form>
	
	</div>
	
	<?php
} else {
// Login output
// ie HTML when not logged in and trying to login
	// used for spoof hardening
	$validate = josSpoofValue(1);
	?>
	
	<div id="yt-login">
	
		<form action="<?php echo sefRelToAbs( 'index.php' ); ?>" method="post" name="loginForm" >
		<?php
		echo $pretext;
		?>
		
		<div class="yt-username">
			<?php if ( $text_in) { ?>
				<input name="username" id="mod_login_username" type="text" class="inputbox" alt="username" size="10" value="<?php echo _USERNAME; ?>" onfocus="if(this.value=='<?php echo _USERNAME; ?>') this.value='';" />
			<?php } else { ?>
				<label for="mod_login_username"><?php echo _USERNAME; ?></label>
				<input name="username" id="mod_login_username" type="text" class="inputbox" alt="username" size="10" />
			<?php } ?>
		</div>
		
		<div class="yt-password">
			<?php if ( $text_in) { ?>
				<input type="password" id="mod_login_password" name="passwd" class="inputbox" size="10" alt="password" value="<?php echo _PASSWORD; ?>" onfocus="if(this.value=='<?php echo _PASSWORD; ?>') this.value='';" />
			<?php } else { ?>
				<label for="mod_login_password"><?php echo _PASSWORD; ?></label>
				<input type="password" id="mod_login_password" name="passwd" class="inputbox" size="10" alt="password" />
			<?php } ?>
		</div>
			
		<?php if ( $auto_remember ) { ?>
			<input type="hidden" name="remember" value="yes" />
		<?php } else { ?>
		<div class="yt-remember">
			<label for="mod_login_remember"><?php echo _REMEMBER_ME; ?></label>
			<input type="checkbox" name="remember" id="mod_login_remember" class="inputbox" value="yes" alt="Remember Me" />
		</div>
		<?php } ?>
		
		<div class="yt-login-button">
			<button value="<?php if ( !$login_button ) { echo _BUTTON_LOGIN; } ?>" name="Submit" type="submit"><?php if ( !$login_button ) { echo _BUTTON_LOGIN; } ?></button>
		</div>
		
		<div class="yt-break"></div>
		
		<?php if ( $lostpassword ) { ?>
		<div class="yt-lostpassword">
			<a href="<?php echo sefRelToAbs( 'index.php?option=com_registration&amp;task=lostPassword' ); ?>"><?php echo _LOST_PASSWORD; ?></a>
		</div>
		<?php } ?>
		
		<?php if ( $registration_enabled ) { ?>
		<div class="yt-registration">
			<?php echo _NO_ACCOUNT; ?>
			<a href="<?php echo sefRelToAbs( 'index.php?option=com_registration&amp;task=register' ); ?>"><?php echo _CREATE_ACCOUNT; ?></a>
		</div>
		<?php } ?>
		
		<?php
		echo $posttext;
		?>

		<input type="hidden" name="option" value="login" />
		<input type="hidden" name="op2" value="login" />
		<input type="hidden" name="lang" value="<?php echo $mosConfig_lang; ?>" />
		<input type="hidden" name="return" value="<?php echo sefRelToAbs( $login ); ?>" />
		<input type="hidden" name="message" value="<?php echo $message_login; ?>" />
		<input type="hidden" name="force_session" value="1" />
		<input type="hidden" name="<?php echo $validate; ?>" value="1" />
		</form>
		
	</div>	
	
	<?php
}
?>