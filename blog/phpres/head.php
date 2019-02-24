<?php
function add_head_html($title, $keywords, $description){
	global $language;
	echo '
<!DOCTYPE html>
<html lang="', $language,'">
  <head>
    <title>', $title,'</title>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="keywords" content="', $keywords,'" />
  	<meta name="description" content="', $description,'" />
  	<meta name="alexaVerifyID" content="v29ZnO1qm4DkMR-EiIIz_aOrQ00" />
  	<link href="../images/favicon.png" rel="icon" type="image/png">
  	<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
  	<link rel="stylesheet" href="../css/webdesign.css" type="text/css">
  	<link rel="stylesheet" href="../css/fontawesome.min.css" type="text/css">
  	<script src="../js/jquery.min.js" type="text/javascript"></script>
  	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
  	<script type="text/javascript">
  	  (function() {
        var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;
        po.src = "https://apis.google.com/js/plusone.js?publisherid=106919341084706153999";
        var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);
      })();
  	</script>
  </head>
  <body>
';
} 
?>