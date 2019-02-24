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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cluj web designer - creare site Cluj, optimizare site, promovare site</title>
<meta name="keywords" content="web designer, cluj web, site Cluj, creare site, optimizare site" />
<meta name="description" content="Web design, creare si optimizare site Cluj, Bistrita, Alba, Mures, Salaj, Bihor, Arad. Daca aveti nevoie de un site nou sau de imbunatatirea site-ului deja existent, suntem gata sa va ajutam." />
<link href="css/webdesign.css" rel="stylesheet" type="text/css" />
<link rel="icon" type="image/png" href="images/favicon.png">

<script type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">
//Smooth Navigational Menu
//(c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
//This notice MUST stay intact for legal use
//Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
</script>

<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "menu",
	orientation: 'h',
	classname: 'ddsmoothmenu',
	contentsource: "markup"
})
</script>

<!-- aleg un stil PiroBox !-->
<link href="css_pirobox/black/style.css" media="screen" title="black" rel="stylesheet" type="text/css" />

<!-- adaug JavaScript & PiroBox in header !-->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/piroBox.1_2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$().piroBox({
        my_speed: 600,
        bg_alpha: 0.5,
        radius: 4,
        scrollImage : false,
        pirobox_next : 'piro_next',
        pirobox_prev : 'piro_prev',
        close_all : '.piro_close',
        slideShow : 'slideshow',
        slideSpeed : 4
});
});
</script>

<!-- Google Analytics !-->
<script type="text/javascript">
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42980001-1', 'iwannaweb.ro');
  ga('send', 'pageview');
</script>
  
</head>
<body id="subpage">
<div id="container">
	<div id="header">
    	<div id="sitetitle"><h1><a href="http://www.iwannaweb.ro">Cluj web designer, creares site Cluj, optimizare site Cluj, promovare site Cluj</a></h1></div>
        <div id="menu" class="ddsmoothmenu">
            <ul>
              	<li><a href="http://www.iwannaweb.ro/index.html">web design</a></li>
         		<li><a href="http://www.iwannaweb.ro/helpdesk.html">helpdesk</a>
                    <ul>
                        <li><a href="http://www.iwannaweb.ro/helpdesk_hardware.html">Hardware</a></li>
                        <li><a href="http://www.iwannaweb.ro/helpdesk_software.html">Software</a></li>
                        <li><a href="http://www.iwannaweb.ro/helpdesk_devices.html">Devices</a></li>
                  	</ul>
              	</li>
          		<li><a href="http://www.iwannaweb.ro/portofoliu_page3.html">creare site</a>
                    <ul>
                        <li><a href="http://www.crinamaris.ro">www.crinamaris.ro</a></li>
                        <li><a href="http://www.iwannaweb.ro">www.iwannaweb.ro</a></li>
						<li><a href="http://www.alinafrandes.ro">www.alinafrandes.ro</a></li>
						<li><a href="http://www.masinidebrodat.com">masinidebrodat.com</a></li>
                  	</ul>
              	</li>
              	<li><a href="http://www.iwannaweb.ro/blog/">blog</a></li>
              	<li><a href="http://www.iwannaweb.ro/contact.asp" class="selected">contact</a></li>
            </ul>
            <br style="clear: left" />
        </div>
    </div>
    
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
	<!-- social networking goes here !-->
			<div class="col_allw300">
				<a href="http://www.facebook.com/iwannaweb"><img src="images/fb_32_32.png" alt="Cluj web designer" style="vertical-align:middle"/></a>
				<a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
				<a href="http://www.facebook.com/iwannaweb">Facebook</a>
			</div>
			<div class="col_allw300">
				<a href="http://www.twitter.com/iwannaweb"><img src="images/tw_32_32.png" alt="Cluj web designer" style="vertical-align:middle"/></a>
				<a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
				<a href="http://www.twitter.com/iwannaweb">Twitter</a>
			</div>
			<div class="col_allw300 col_rm">
				<a href="//plus.google.com/106919341084706153999?prsrc=3" rel="publisher" target="_top" style="text-decoration:none;vertical-align:middle">
				<img src="//ssl.gstatic.com/images/icons/gplus-16.png" alt="cluj web designer Google+" style="border:0;width:16px;height:16px;"/>
				</a>
				<a href="https://plus.google.com/106919341084706153999" rel="publisher"></a>
				<a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> pe 
				<a href="https://plus.google.com/106919341084706153999">Google+</a>
			</div>
			<div class="col_allw300">			
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
<div id="footer_container">
    <div id="footer">
        Copyright &copy; 2013-2014 <a href="http://www.iwannaweb.ro">iwanna.web</a> | 
        <a href="http://www.iwannaweb.ro" target="_parent"><b>Cluj web designer</b></a> - creare, optimizare si promovare site Cluj Napoca
		<div itemscope itemtype="http://schema.org/LocalBusiness">
			<div itemscope itemtype="http://schema.org/Person">
				<a itemprop="url" href="http://www.iwannaweb.ro">
					<span itemprop="name"><strong>iwanna.web</strong></span>
				</a>,
				<span itemprop="email">e-mail: helpdesk@iwannaweb.ro</span>,
				<span itemprop="telephone">telefon: (+40) 0728 76 42 69</span>
			</div>
			<div itemprop="description">webdesign, SEO, publicitate online, solutii helpdesk</div>
			<div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
				<span itemprop="streetAddress">8 Meteor</span>,
				<span itemprop="addressLocality"> Cluj-Napoca</span><br>
				<span itemprop="postalCode">400492</span>,
				<span itemprop="addressRegion"> Cluj</span>,
				<span itemprop="addressCountry"> Romania</span><br>
			</div>
		</div>
 		<!--div class="cleaner"></div-->
    </div>
</div> 
</body>
</html>
