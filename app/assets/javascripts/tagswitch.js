// JavaScript Document
<!--
//标签卡
var tID=0;
function ShowTabs(ID){
  if(ID!=tID){
    TabTitle[tID].className='tabOff';
    TabTitle[ID].className='tabOn';
    Tabs[tID].style.display='none';
    Tabs[ID].style.display='block';
    tID=ID;
  }
}
function setTab(area,id) {
	var tabArea=document.getElementById(area);
	var contents=tabArea.childNodes;
	for(i=0; i<contents.length; i++) {
		if(contents[i].className=='tabcontent'){contents[i].style.display='none';}
	}
	document.getElementById(id).style.display='';
	var tabs=document.getElementById(area+'tabs').getElementsByTagName('div');
	for(i=0; i<tabs.length; i++) { tabs[i].className='one_2_no'; }
	document.getElementById(id+'tab').className='one_2_yes';
	document.getElementById(id+'tab').blur();

}
function update_browser () {
	var ie6 = navigator.appVersion.indexOf("MSIE 6");
	if (ie6>-1) {
		document.getElementById("update_browser").style.display="block";
	}
}


//-->