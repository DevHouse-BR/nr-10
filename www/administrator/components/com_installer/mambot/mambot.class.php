<?php
/**
* @version $Id: mambot.class.php 10002 2008-02-08 10:56:57Z willebil $
* @package Joomla
* @subpackage Installer
* @copyright Copyright (C) 2005 Open Source Matters. All rights reserved.
* @license http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL, see LICENSE.php
* Joomla! is free software. This version may have been modified pursuant
* to the GNU General Public License, and as distributed it includes or
* is derivative of works licensed under the GNU General Public License or
* other free or open source software licenses.
* See COPYRIGHT.php for copyright notices and details.
*/

// no direct access
defined( '_VALID_MOS' ) or die( 'Restricted access' );

/**
* Module installer
* @package Joomla
* @subpackage Installer
*/
class mosInstallerMambot extends mosInstaller {
	/**
	* Custom install method
	* @param boolean True if installing from directory
	*/
	function install( $p_fromdir = null ) {
		
		josSpoofCheck();
	
		global $mosConfig_absolute_path, $database;

		if (!$this->preInstallCheck( $p_fromdir, 'mambot' )) {
			return false;
		}

		$xmlDoc 	= $this->xmlDoc();
		$mosinstall =& $xmlDoc->documentElement;

		// Set some vars
		$e = &$mosinstall->getElementsByPath( 'name', 1 );
		$this->elementName( $e->getText() );

		$folder = $mosinstall->getAttribute( 'group' );
		$this->elementDir( mosPathName( $mosConfig_absolute_path . '/mambots/' . $folder ) );

		if(!file_exists($this->elementDir()) && !mosMakePath($this->elementDir())) {
			$this->setError( 1, 'Failed to create directory "' . $this->elementDir() . '"' );
			return false;
		}

		if ($this->parseFiles( 'files', 'mambot', 'N�o existem arquivos definidos como Plugin' ) === false) {
			return false;
		}

		// Insert mambot in DB
		$query = "SELECT id"
		. "\n FROM #__mambots"
		. "\n WHERE element = " . $database->Quote( $this->elementName() )
		;
		$database->setQuery( $query );
		if (!$database->query()) {
			$this->setError( 1, 'Erro SQL: ' . $database->stderr( true ) );
			return false;
		}

		$id = $database->loadResult();

		if (!$id) {
			$row = new mosMambot( $database );
			$row->name 		= $this->elementName();
			$row->ordering 	= 0;
			$row->folder 	= $folder;
			$row->iscore 	= 0;
			$row->access 	= 0;
			$row->client_id = 0;
			$row->element 	= $this->elementSpecial();
			
			if ($folder == 'editors') {
				$row->published	= 1;
			}

			if (!$row->store()) {
				$this->setError( 1, 'Erro SQL: ' . $row->getError() );
				return false;
			}
		} else {
			$this->setError( 1, 'O plugin "' . $this->elementName() . '" j� existe!' );
			return false;
		}
		if ($e = &$mosinstall->getElementsByPath( 'description', 1 )) {
			$this->setError( 0, $this->elementName() . '<p>' . $e->getText() . '</p>' );
		}

		return $this->copySetupFile('front');
	}
	/**
	* Custom install method
	* @param int The id of the module
	* @param string The URL option
	* @param int The client id
	*/
	function uninstall( $id, $option, $client=0 ) {
		global $database, $mosConfig_absolute_path;

		josSpoofCheck(null, null, 'request');

		$id = intval( $id );
		$query = "SELECT name, folder, element, iscore"
		. "\n FROM #__mambots"
		. "\n WHERE id = " . (int) $id
		;
		$database->setQuery( $query );

		$row = null;
		$database->loadObject( $row );
		if ($database->getErrorNum()) {
			HTML_installer::showInstallMessage( $database->stderr(), 'Uninstall -  error',
			$this->returnTo( $option, 'mambot', $client ) );
			exit();
		}
		if ($row == null) {
			HTML_installer::showInstallMessage( 'Invalid object id', 'Uninstall -  error',
			$this->returnTo( $option, 'mambot', $client ) );
			exit();
		}

		if (trim( $row->folder ) == '') {
			HTML_installer::showInstallMessage( 'Campo de Diret�rio vazio, N�o foi poss�vel remover arquivos', 'Desinstalar -  erro',
			$this->returnTo( $option, 'mambot', $client ) );
			exit();
		}

		$basepath 	= $mosConfig_absolute_path . '/mambots/' . $row->folder . '/';
		$xmlfile 	= $basepath . $row->element . '.xml';

		// see if there is an xml install file, must be same name as element
		if (file_exists( $xmlfile )) {
			$this->i_xmldoc = new DOMIT_Lite_Document();
			$this->i_xmldoc->resolveErrors( true );

			if ($this->i_xmldoc->loadXML( $xmlfile, false, true )) {
				$mosinstall =& $this->i_xmldoc->documentElement;
				// get the files element
				$files_element =& $mosinstall->getElementsByPath( 'files', 1 );
				if (!is_null( $files_element )) {
					$files = $files_element->childNodes;
					foreach ($files as $file) {
						// delete the files
						$filename = $file->getText();
						if (file_exists( $basepath . $filename )) {
							$parts = pathinfo( $filename );
							$subpath = $parts['dirname'];
							if ($subpath != '' && $subpath != '.' && $subpath != '..') {
								echo '<br />Deleting: '. $basepath . $subpath;
								$result = deldir(mosPathName( $basepath . $subpath . '/' ));
							} else {
								echo '<br />Deleting: '. $basepath . $filename;
								$result = unlink( mosPathName ($basepath . $filename, false));
							}
							echo intval( $result );
						}
					}

					// remove XML file from front
					echo "Deleting XML File: $xmlfile";
					@unlink(  mosPathName ($xmlfile, false ) );

					// define folders that should not be removed
					$sysFolders = array(
						'content',
						'search'
					);
					if (!in_array( $row->folder, $sysFolders )) {
						// delete the non-system folders if empty
						if (count( mosReadDirectory( $basepath ) ) < 1) {
							deldir( $basepath );
						}
					}
				}
			}
		}

		if ($row->iscore) {
			HTML_installer::showInstallMessage( $row->name .' � um elemento do sistema e n�o pode ser desinstalado.<br />Ser� necess�rio despublic�-lo caso n�o pretenda continuar a utiliz�-lo',
			'Uninstall -  error', $this->returnTo( $option, 'mambot', $client ) );
			exit();
		}

		$query = "DELETE FROM #__mambots"
		. "\n WHERE id = " . (int) $id
		;
		$database->setQuery( $query );
		if (!$database->query()) {
			$msg = $database->stderr;
			die( $msg );
		}
		return true;
	}
}
?>
