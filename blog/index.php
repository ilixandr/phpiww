<?php
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = determine language now             =
    ======================================*/
  global $language;
  if (isset($_GET["lang"])){
    if ($_GET["lang"] == "en"){
      $language = "en";
    } else {
      $language = "ro";
    }
  } else {
    $language="ro";
  }
  $posts = scandir(dirname(__FILE__) . '/posts', 1);
  $totalposts = count($posts) - 2;
  $postsnumber = min(count($posts) - 2, 10);
  $poststoadd = array_slice($posts, 0, $postsnumber);
  if (isset($_GET["post"])){
    if ($_GET["post"] == ""){
      $current_post = dirname(__FILE__) . '/posts/' . $posts[0];
    } else {
      /* First, let's check if the post really exists and this is not an XSS attack: */
      if (in_array($_GET["post"], $posts)){
        $current_post = dirname(__FILE__) . '/posts/' . ($_GET["post"]);
      } else {
        $current_post = dirname(__FILE__) . '/posts/0404.html';
      }
      
    }
  } else {
    $current_post = dirname(__FILE__) . '/posts/' . $posts[0];
  }
  /* Have to check 
  - https://stackoverflow.com/questions/7403542/php-security-get-variables-url-safe
  - https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet#XSS_Prevention_Rules
  */
  $socialnetworks = dirname(__FILE__) . '/htmlres/socialnetworks.html';
  /*======================================
    = Ionut: 28-Feb-2018                 =
    ======================================
    = load required php files here       =
    ======================================*/
  require_once(dirname(__FILE__) . '/phpres/head.php');
  require_once(dirname(__FILE__) . '/phpres/menu.php');
  require_once(dirname(__FILE__) . '/phpres/footer.php');
  require_once(dirname(__FILE__) . '/phpres/strings.' . $language . '.php');
  require_once(dirname(__FILE__) . '/lastposts.php');
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
  readfile($current_post);
  add_last_posts($postsnumber, $poststoadd);
  add_all_posts($totalposts, $posts);
  readfile($socialnetworks);
  add_footer_html();
?>
