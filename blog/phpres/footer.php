<?php
function add_footer_html(){
  global $language;
  require(dirname(__FILE__) . '/strings.' . $language . '.php');
	echo '    <div class="cleaner h20"></div>
    <footer id="iwwFooter">
      <div class="container">
        <div class="row">
          <div class="col-sm-3">
            <h2 class="logo"><a href="http://www.iwannaweb.ro"><img src="../images/logo.png" alt=""/></a></h2>
          </div>
          <div class="col-sm-2">
            <h5>', $txt["webdev_small"], '</h5>
            <ul>
              <li><a href="#"><i class="fa fa-info special"></i> ', $txt["news"], '</a></li>
              <li><a href="#"><i class="fa fa-server special"></i> ', $txt["free_soft"], '</a></li>
              <li><a href="#"><i class="fa fa-question-circle special"></i> ', $txt["ask_help"], '</a></li>
            </ul>
          </div>
          <div class="col-sm-2">
            <h5>', $txt["crypto_small"], '</h5>
            <ul>
              <li><a href="#"><i class="fa fa-lightbulb-o special"></i> ', $txt["info"], '</a></li>
              <li><a href="#"><i class="fa fa-bar-chart special"></i> ', $txt["trends"], '</a></li>
              <li><a href="#"><i class="fa fa-twitter special"></i> ', $txt["twitter_iwannacrypto"], '</a></li>
            </ul>
          </div>
          <div class="col-sm-2">
            <h5>', $txt["social"], '</h5>
            <ul>
              <li><a href="http://www.iwannaweb.ro/blog/"><i class="fa fa-pencil-square special"></i> ', $txt["blog_small"], '</a></li>
              <li><a href="#"><i class="fa fa-bullhorn special"></i> ', $txt["recomm"], '</a></li>
              <li><a href="#"><i class="fa fa-paper-plane special"></i> ', $txt["telegram"], '</a></li>
            </ul>
          </div>
          <div class="col-sm-3">
            <div class="social-networks">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
            </div>
            <a href="http://www.iwannaweb.ro/contact.asp" class="btn btn-default">', $txt["contact_us"], '</a>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <p>© 2013-', date("Y"), ' <a href="http://www.iwannaweb.ro">iwannaweb</a> | ', $txt["slogan"], ' </p>
      </div>
    </footer>
  </body>
</html>';
}
?>