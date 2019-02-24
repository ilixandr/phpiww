<?php
function add_menu($pagename){
  global $language;
  require(dirname(__FILE__) . '/strings.' . $language . '.php');
  $index_active = "";
  $webdev_active = "";
  $portfolio_active = "";
  $crypto_active = "";
  $blog_active = "";
  switch ($pagename){
  	case "index":
  	  $index_active = " class=\"active\"";
  	  break;
  	case "webdev":
  	  $webdev_active = "active ";
  	  break;
  	case "webdevservices":
  	  $webdev_active = "active ";
  	  break;
  	case "webdevpricing":
  	  $webdev_active = "active ";
  	  break;
  	case "webdevsoftware":
  	  $webdev_active = "active ";
  	  break;    
  	case "portfolio":
  	  $portfolio_active = "active ";
  	  break;
  	case "portfolioarchive":
  	  $portfolio_active = "active ";
  	  break;
  	case "crypto":
  	  $crypto_active = " class=\"active\"";
  	  break;
  	default:
  	  $blog_active = " class=\"active\"";
  }
  echo '    <nav class="navbar navbar-inverse">
  	  <div class="container-fluid">
        <div class="navbar-header">
      	  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
        	<span class="icon-bar"></span>
        	<span class="icon-bar"></span>                        
      	  </button>
      	  <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt=""/></a>
    	</div>
    	<div class="container">
    	  <div class="collapse navbar-collapse" id="myNavbar">
      	    <ul class="nav navbar-nav">
              <li', $index_active, '><a href="http://www.iwannaweb.ro">', $txt["home"],'</a></li>
              <li class="', $webdev_active, 'dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="webdev.html">', $txt["webdev"], '<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="webdev.php">', $txt["webdev"], '</a></li>	
                  <li><a href="webdevservices.php">', $txt["services"], '</a></li>
                  <li><a href="webdevpricing.php">', $txt["pricing"], '</a></li>
                  <li><a href="webdevsoftware.php">', $txt["software"], '</a></li>
                </ul>
              </li>
              <li class="', $portfolio_active, 'dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="http://www.iwannaweb.ro/portofoliu_page3.html">', $txt["portfolio"], '<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="portfolio.php">', $txt["portfolio"], '</a></li>
                  <li><a href="portfolioarchive.php">', $txt["archive"], '</a></li>
                </ul>
              </li>
              <li', $crypto_active,'><a href="crypto/">', $txt["crypto"], '</a></li>
              <li', $blog_active,'><a href="http://www.iwannaweb.ro/blog/">', $txt["blog"], '</a></li>
              <li><a href="http://www.iwannaweb.ro/contact.asp">', $txt["contact"], '</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="http://www.iwannaweb.ro/"><img class="lang-icon" src="images/lang/', $language, '.svg" alt="', $txt["lang_menu_alt"], '"/><span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="', $pagename, '.php?lang=ro">ROMÂNĂ <img class="lang-icon" src="images/lang/ro.svg" alt="ROMÂNĂ"/></a></li>
                  <li><a href="', $pagename, '.php?lang=en">ENGLISH <img class="lang-icon" src="images/lang/en.svg" alt="ENGLISH"/></a></li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form navbar-right" action="/action_page.php">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="', $txt["search"], '">
                <div class="input-group-btn">
                  <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                  </button>
                </div>  
              </div>
            </form> 
          </div>
        </div>
      </div>
    </nav>';
}
?>