<?PHP>

$credentials = "username:pass"; 
$url = "http://mercury.itv.com/PlaylistService.svc";
$indexNumber = "324938";
/*
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <SOAP-ENV:Body>
        <tem:GetPlaylist xmlns:tem="http://tempuri.org/" xmlns:itv="http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types" xmlns:com="http://schemas.itv.com/2009/05/Common">
            <tem:request>
                <itv:RequestGuid>FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF</itv:RequestGuid>
                <itv:Vodcrid>
                    <com:Id>324938</com:Id>
                    <com:Partition>itv.com</com:Partition>
                </itv:Vodcrid>
            </tem:request>
            <tem:userInfo>
                <itv:GeoLocationToken>
                    <itv:Token/>
                </itv:GeoLocationToken>
                <itv:RevenueScienceValue>scc=true; svisit=1; sc4=Other</itv:RevenueScienceValue>
            </tem:userInfo>
            <tem:siteInfo>
                <itv:Area>ITVPLAYER.VIDEO</itv:Area>
                <itv:Platform>DotCom</itv:Platform>
                <itv:Site>ItvCom</itv:Site>
            </tem:siteInfo>
        </tem:GetPlaylist>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>

*/
$x = '<SOAP-ENV:Envelope';
$x = $x  . " " .  'xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"';
$x = $x  . " " .  'xmlns:xsd="http://www.w3.org/2001/XMLSchema"';
$x = $x  . " " .  'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">';
$x = $x  . " " .  '    <SOAP-ENV:Body>';
$x = $x  . " " .  '        <tem:GetPlaylist xmlns:tem="http://tempuri.org/" xmlns:itv="http://schemas.datacontract.org/2004/07/Itv.BB.Mercury.Common.Types" xmlns:com="http://schemas.itv.com/2009/05/Common">';
$x = $x  . " " .  '            <tem:request>';
$x = $x  . " " .  '                <itv:RequestGuid>FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF</itv:RequestGuid>';
$x = $x  . " " .  '                <itv:Vodcrid>';
$x = $x  . " " .  '<com:Id>' . $indexNumber . '</com:Id>';
$x = $x  . " " .  '                    <com:Partition>itv.com</com:Partition>';
$x = $x  . " " .  '                </itv:Vodcrid>';
$x = $x  . " " .  '            </tem:request>';
$x = $x  . " " .  '            <tem:userInfo>';
$x = $x  . " " .  '                <itv:GeoLocationToken>';
$x = $x  . " " .  '                    <itv:Token/>';
$x = $x  . " " .  '                </itv:GeoLocationToken>';
$x = $x  . " " .  '                <itv:RevenueScienceValue>scc=true; svisit=1; sc4=Other</itv:RevenueScienceValue>';
$x = $x  . " " .  '            </tem:userInfo>';
$x = $x  . " " .  '            <tem:siteInfo>';
$x = $x  . " " .  '                <itv:Area>ITVPLAYER.VIDEO</itv:Area>';
$x = $x  . " " .  '                <itv:Platform>DotCom</itv:Platform>';
$x = $x  . " " .  '                <itv:Site>ItvCom</itv:Site>';
$x = $x  . " " .  '            </tem:siteInfo>';
$x = $x  . " " .  '        </tem:GetPlaylist>';
$x = $x  . " " .  '    </SOAP-ENV:Body>';
$x = $x  . " " .  '</SOAP-ENV:Envelope>';


echo "The SOAP request is $x";

$body = $x; /// Your SOAP XML needs to be in this variable




$ch = curl_init(); 
curl_setopt($ch, CURLOPT_URL, $url);  
curl_setopt($ch, CURLOPT_TIMEOUT, 60); 
curl_setopt($ch, CURLOPT_USERAGENT, $defined_vars['HTTP_USER_AGENT']);
curl_setopt($ch, CURLOPT_HTTPHEADER,array (
'SOAPAction:"http://tempuri.org/PlaylistService/GetPlaylist"',
'Accept-Encoding:gzip,deflate',
'Content-Type:text/xml; charset=UTF-8'));





// Stuff I have added
curl_setopt($ch, CURLOPT_POST, true); 
curl_setopt($ch, CURLOPT_POSTFIELDS, $body); 


$data = curl_exec($ch); 
echo $data;