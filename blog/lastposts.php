<?php
function add_last_posts($postsnumber, $poststoadd){
  echo '<div class="col-sm-3">
    <h4>Ultimele postări</h4>';
  for ($i = 0; $i < $postsnumber; $i++){
  	echo '&check; <a href="index.php?post=', $poststoadd[$i], '">', preg_replace('/\d{4} \d{2} \d{2} /i', '', str_replace(".html", "" , str_replace("-", " ", $poststoadd[$i]))), '</a><br />';
  }
  echo '</div>';
}
function add_all_posts($totalposts, $allposts){
  echo '
	<div class="col-sm-12">
	<div class="pagging">
	  <ul>
	    <li><a href=index.php?post="', $allposts[$totalposts - 2], '" title="', preg_replace('/\d{4} \d{2} \d{2} /i', '', str_replace(".html", "", str_replace("-", " ", $allposts[$totalposts - 2]))), '" target="_parent">&lt;&lt;&lt;</a></li>';
  for ($i = $totalposts - 2; $i >= 0 ; $i--){
  	echo '        <li><a href="index.php?post=', $allposts[$i], '" title="', preg_replace('/\d{4} \d{2} \d{2} /i', '', str_replace(".html", "", str_replace("-", " ", $allposts[$i]))), '" target="_parent">', $totalposts - $i - 1, '</a></li>';
  }
  echo '<li><a href=index.php?post="', $allposts[0], '" title="', preg_replace('/\d{4} \d{2} \d{2} /i', '', str_replace(".html", "", str_replace("-", " ", $allposts[0]))), '" target="_parent">&gt;&gt;&gt;</a></li>
      </ul>
	  <div class="cleaner"></div>
    </div></div>';
}
?>  