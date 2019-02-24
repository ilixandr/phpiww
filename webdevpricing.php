<?php
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = determine language now             =
    ======================================*/
  global $language;
  if ($_GET["lang"] == "en"){$language = "en";}else{$language = "ro";}
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = load required php files here       =
    ======================================*/
  require_once(dirname(__FILE__) . '/phpres/head.php');
  require_once(dirname(__FILE__) . '/phpres/menu.php');
  require_once(dirname(__FILE__) . '/phpres/content.php');
  require_once(dirname(__FILE__) . '/phpres/footer.php');
  require_once(dirname(__FILE__) . '/phpres/strings.' . $language . '.php');
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = Build some useful variables here   =
    ======================================*/
  $pagename = basename(__FILE__, ".php");
  $pagetitle = $txt[$pagename . "_title"];
  $pagekeywords = $txt[$pagename . "_keywords"];
  $pagedescription = $txt[$pagename . "_description"];
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = it's time to build the webpage     =
    ======================================*/  
  add_head_html($pagetitle, $pagekeywords, $pagedescription);
  add_menu($pagename);
  add_content($pagename);
  add_footer_html();
?>