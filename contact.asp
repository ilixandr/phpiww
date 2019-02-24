<%@ Language=VBScript%>
<!DOCTYPE html> 
<%
mes = ""
IsSuccess = false

sTo = "contact@iwannaweb.ro"
sFrom = Trim(Request.Form("E-mail"))
sSubject = Trim(Request.Form("Subiect"))
sMailServer = "127.0.0.1"
sBody = Trim(Request.Form("Mesaj"))

if Request("__action")="SendEMail" then
	SendEMail()	
end if

Sub SendEMail()

	Set objMail = Server.CreateObject("CDO.Message")
	Set objConf = Server.CreateObject("CDO.Configuration") 
	Set objFields = objConf.Fields
	
	With objFields
		.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")  = sMailServer
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10 
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
		.Update 
	End With

	With objMail
		Set .Configuration = objConf
		.From = sFrom
		.To = sTo
		.Subject = sSubject
		.TextBody = sBody
	End With
    
    Err.Clear 
	on error resume next

    objMail.Send
	if len(Err.Description) = 0 then
        mes = " Mesajul dumneavoastra a fost trimis la " + sTo
        mes = mes + ". Va multumim! "
        IsSuccess = true
    else
		mes = " " + Err.Description + " A aparut o eroare, iar mesajul nu a fost trimis."
	end if
	Set objFields = Nothing
	Set objConf = Nothing
	Set objMail = Nothing
End sub

Sub Alert(html)
	if IsSuccess then
		Response.Write "<div id='container'>Success:" & html & "</div>"
	else
		Response.Write "<div id='container'>Failure:" & html & "</div>"
	end if
End Sub
%>
<html lang="ro">
  <head>
    <title>Experience web freedom | iwannaweb.ro</title>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<meta name="keywords" content="cluj web, site cluj, web design, optimizare site, creare site, web designer, realizare site, promovare site" />
  	<meta name="description" content="Web design, creare site si optimizare site Cluj, Bistrita, Alba, Mures, Salaj, Bihor, Arad. Realizare site, promovare site - Cluj web designer." />
  	<meta name="alexaVerifyID" content="v29ZnO1qm4DkMR-EiIIz_aOrQ00" />
  	<link href="images/favicon.png" rel="icon" type="image/png">
  	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
  	<link rel="stylesheet" href="css/webdesign.css" type="text/css">
  	<link rel="stylesheet" href="css/fontawesome.min.css" type="text/css">
  	<script src="js/jquery.min.js" type="text/javascript"></script>
  	<script src="js/bootstrap.min.js" type="text/javascript"></script>
  	<script type="text/javascript">
  	  (function() {
        var po = document.createElement("script"); po.type = "text/javascript"; po.async = true;
        po.src = "https://apis.google.com/js/plusone.js?publisherid=106919341084706153999";
        var s = document.getElementsByTagName("script")[0]; s.parentNode.insertBefore(po, s);
      })();
  	</script>
  </head>
  <body>
    <nav class="navbar navbar-inverse">
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
              <li class="active"><a href="http://www.iwannaweb.ro">IWANNAWEB</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="webdev.html">DEZVOLTARE WEB<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="webdev.html">DEZVOLTARE WEB</a></li>	
                  <li><a href="webdev-services.html">SERVICII</a></li>
                  <li><a href="webdev-prices.html">PRETURI</a></li>
                  <li><a href="webdev-software.html">SOFTWARE</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="http://www.iwannaweb.ro/portofoliu_page3.html">PORTOFOLIU<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">PORTOFOLIU</a></li>
                  <li><a href="#">ARHIVA</a></li>
                </ul>
              </li>
              <li><a href="http://www.iwannaweb.ro/crypto/">CRYPTOMONEDE</a></li>
              <li><a href="http://www.iwannaweb.ro/blog/">BLOG</a></li>
              <li><a href="http://www.iwannaweb.ro/contact.asp">CONTACT</a></li>
            </ul>
            <!--ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
            </ul-->
            <form class="navbar-form navbar-right" action="/action_page.php">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Caută">
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
    </nav>
    <div id="iwwmain">
    	<h2>Contact <a href="http://www.iwannaweb.ro">iwanna.web | Cluj web designer</a></h2>
		<% if len(mes) > 0 then	Alert(mes) end if %>
        <div class="col_w630 float_l">
        	
             <div id="iwwcontact">
        
                <h4>Trimiteţi-ne un mesaj...</h4>
                
                <form id="form1" action="contact.asp?__action=SendEMail&tp=<%= rnd(1)*100*timer %>" method="POST">
					
					<!--label for="Nume">Nume:</label> <input type="text" id="Nume" name="Nume" class="required input_field" value="<'% Response.Write(sFrom) %>" />
					<div class="cleaner h10"></div!-->
																	
					<label for="E-mail">E-mail:</label> <input type="text" class="validate-email required input_field" name="E-mail" id="E-mail" value="<% Response.Write(sEmail) %>"/>
					<div class="cleaner h10"></div>
															
					<label for="Subiect">Subiect:</label> <input type="text" class="validate-subject required input_field" name="Subiect" id="Subiect" value="<% Response.Write(sSubject) %>"/>				               
					<div class="cleaner h10"></div>
											
					<label for="Mesaj">Mesaj:</label> <textarea id="text" name="Mesaj" rows="0" cols="0" class="required"><% Response.Write(sBody) %></textarea>
					<div class="cleaner h10"></div>				
																
					<input type="submit" value="Trimite" id="submit" name="submit" class="submit_btn float_l" />
					<input type="reset" value="Reset" id="reset" name="reset" class="submit_btn float_r" />
										
				</form>
        
            </div> 
        </div>
        
        <div class="col_w300 float_r">
            <div class="col_fw">	
            	<h4>Adresa:</h4>
                <h6><strong>iwanna.web | Cluj web designer</strong></h6>
                400492, Cluj-Napoca, <br/>
                Cluj, România<br/>
                "web design pentru toata lumea"<br/><br/>
				
				<strong>Telefon:</strong> +40 (0)7 28 76 42 69<br />
                <strong>E-mail:</strong> <a href="mailto:helpdesk@iwannaweb.ro">helpdesk@iwannaweb.ro</a>
            </div>            
            <div class="col_fw_last">
                <h4>Unde ne gasiţi...</h4>
                <div id="map"><a class="pirobox" href="images/webdesign_map_big.png" title="Adresa noastra..."><img src="images/webdesign_map_small.png" alt="Cluj web designer, creare site Cluj" /></a></div>                
				<a href="https://maps.google.ro/maps?f=q&amp;source=s_q&amp;hl=ro&amp;geocode=&amp;q=Strada+Meteor,+Cluj-Napoca,+Cluj&amp;aq=0&amp;oq=strada+mete&amp;sll=46.777248,23.59989&amp;sspn=0.289198,0.837021&amp;gl=ro&amp;ie=UTF8&amp;hq=&amp;hnear=Strada+Meteor,+Cluj-Napoca,+Cluj&amp;t=m&amp;z=14&amp;ll=46.754357,23.590124&amp;" target="_blank">Link Google Maps</a>
			</div>
        </div>

        <div class="cleaner"></div>
    </div>
    <div class="container">
      <div class="col-sm-4">
        <a href="http://www.facebook.com/iwannaweb"><img src="images/fb_32_32.png" alt="Cluj web designer" style="vertical-align:middle"/></a>
        <a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
        <a href="http://www.facebook.com/iwannaweb">Facebook</a>
      </div>
      <div class="col-sm-4">
        <a href="http://www.twitter.com/iwannaweb"><img src="images/tw_32_32.png" alt="Cluj web designer" style="vertical-align:middle"/></a>
        <a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
        <a href="http://www.twitter.com/iwannaweb">Twitter</a>
      </div>
      <div class="col-sm-4">
        <a href="//plus.google.com/106919341084706153999?prsrc=3" rel="publisher" target="_top" style="text-decoration:none;vertical-align:middle">
          <img src="//ssl.gstatic.com/images/icons/gplus-16.png" alt="cluj web designer Google+" style="border:0;width:16px;height:16px;"/>
        </a>
        <a href="https://plus.google.com/106919341084706153999" rel="publisher"></a>
        <a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
        <a href="https://plus.google.com/106919341084706153999">Google+</a>
      </div>
    </div>
    <div class="container">
      <div class="col-sm-4">
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/ro_RO/all.js#xfbml=1";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        </script>
        <div style="margin-left: 10px;" class="fb-like" data-href="https://www.facebook.com/pages/Iwanna-web/192732267566140" data-width="200" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
      </div>
    </div>
    <div class="cleaner h20"></div>
    <footer id="iwwFooter">
      <div class="container">
        <div class="row">
          <div class="col-sm-3">
            <h2 class="logo"><a href="http://www.iwannaweb.ro"><img src="images/logo.png" alt=""/></a></h2>
          </div>
          <div class="col-sm-2">
            <h5>Dezvoltare web</h5>
            <ul>
              <li><a href="#"><i class="fa fa-info special"></i> Noutăţi</a></li>
              <li><a href="#"><i class="fa fa-server special"></i> Software gratuit</a></li>
              <li><a href="#"><i class="fa fa-question-circle special"></i> Solicită ajutor</a></li>
            </ul>
          </div>
          <div class="col-sm-2">
            <h5>Cryptomonede</h5>
            <ul>
              <li><a href="#"><i class="fa fa-lightbulb-o special"></i> Informaţii</a></li>
              <li><a href="#"><i class="fa fa-bar-chart special"></i> Trenduri</a></li>
              <li><a href="#"><i class="fa fa-twitter special"></i> @iwannaCrypto</a></li>
            </ul>
          </div>
          <div class="col-sm-2">
            <h5>Social</h5>
            <ul>
              <li><a href="http://www.iwannaweb.ro/blog/"><i class="fa fa-pencil-square special"></i> Blog</a></li>
              <li><a href="#"><i class="fa fa-bullhorn special"></i> Recomandări</a></li>
              <li><a href="#"><i class="fa fa-paper-plane special"></i> Telegram</a></li>
            </ul>
          </div>
          <div class="col-sm-3">
            <div class="social-networks">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
            </div>
            <a href="http://www.iwannaweb.ro/contact.asp" class="btn btn-default">Contactează-ne</a>
          </div>
        </div>
      </div>
      <div class="footer-copyright">
        <p>© 2013-2018 <a href="http://www.iwannaweb.ro">iwannaweb</a> | Experience web freedom </p>
      </div>
    </footer>
  </body>
</html>
