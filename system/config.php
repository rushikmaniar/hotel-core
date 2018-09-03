<?php
/**
 * Created by PhpStorm.
 * User: rushikwin8
 * Date: 003 03-09-2018
 * Time: 01:13 PM
 */

$ROOTBASECURL = (isset($_SERVER['HTTPS']) ? "https://" : "http://").$_SERVER['HTTP_HOST'];
$ROOTBASECURL .= str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);
$base_url = $ROOTBASECURL;

define('base_url',$base_url);
