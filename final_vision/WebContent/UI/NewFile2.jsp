<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>http://www.blueb.co.kr</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script language="JavaScript" type="text/javascript" src="js/events.js"></script>
<script type="text/JavaScript" language="JavaScript">


var thisDate = 1;							// Tracks current date being written in calendar
var wordMonth = new Array("1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월");
var today = new Date();							// Date object to store the current date
var todaysDay = today.getDay() + 1;					// Stores the current day number 1-7
var todaysDate = today.getDate();					// Stores the current numeric date within the month
var todaysMonth = today.getUTCMonth() + 1;				// Stores the current month 1-12
var todaysYear = today.getFullYear();					// Stores the current year
var monthNum = todaysMonth;						// Tracks the current month being displayed
var yearNum = todaysYear;						// Tracks the current year being displayed
var firstDate = new Date(String(monthNum)+"/1/"+String(yearNum));	// Object Storing the first day of the current month
var firstDay = firstDate.getUTCDay();					// Tracks the day number 1-7 of the first day of the current month
var lastDate = new Date(String(monthNum+1)+"/0/"+String(yearNum));	// Tracks the last date of the current month
var numbDays = 0;
var calendarString = "";
var eastermonth = 0;
var easterday = 0;


function changedate(buttonpressed) {
	if (buttonpressed == "prevyr") yearNum--;
	else if (buttonpressed == "nextyr") yearNum++;
	else if (buttonpressed == "prevmo") monthNum--;
	else if (buttonpressed == "nextmo") monthNum++;
	else  if (buttonpressed == "return") { 
		monthNum = todaysMonth;
		yearNum = todaysYear;
	}

	if (monthNum == 0) {
		monthNum = 12;
		yearNum--;
	}
	else if (monthNum == 13) {
		monthNum = 1;
		yearNum++
	}

	lastDate = new Date(String(monthNum+1)+"/0/"+String(yearNum));
	numbDays = lastDate.getDate();
	firstDate = new Date(String(monthNum)+"/1/"+String(yearNum));
	firstDay = firstDate.getDay() + 1;
	createCalendar();
	return;
}


function easter(year) {
// feed in the year it returns the month and day of Easter using two GLOBAL variables: eastermonth and easterday
var a = year % 19;
var b = Math.floor(year/100);
var c = year % 100;
var d = Math.floor(b/4);
var e = b % 4;
var f = Math.floor((b+8) / 25);
var g = Math.floor((b-f+1) / 3);
var h = (19*a + b - d - g + 15) % 30;
var i = Math.floor(c/4);
var j = c % 4;
var k = (32 + 2*e + 2*i - h - j) % 7;
var m = Math.floor((a + 11*h + 22*k) / 451);
var month = Math.floor((h + k - 7*m + 114) / 31);
var day = ((h + k - 7*m +114) % 31) + 1;
eastermonth = month;
easterday = day;
}


function createCalendar() {
	calendarString = '';
	var daycounter = 0;
	calendarString += '<table width="312" border="0" cellpadding="0" cellspacing="1" bgcolor=#ffffff>';
	calendarString += '<tr>';
// 	calendarString += '<td bgcolor="#FFFFFF" align=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.PrevYr.src=\'http://www.blueb.co.kr/SRC/javascript/image4/PrevYrOn40x40\.jpg\';\" onMouseOut=\"document.PrevYr.src=\'http://www.blueb.co.kr/SRC/javascript/image4/PrevYrOff40x40\.jpg\';\" onClick=\"changedate(\'prevyr\')\"><img name=\"PrevYr\" src=\"http://www.blueb.co.kr/SRC/javascript/image4/PrevYrOff40x40\.jpg\" border=\"0\" alt=\"작 년\"\/><\/a><\/td>';
// 	calendarString += '<td bgcolor="#FFFFFF" align=\"center\" width=\"40\" height=\"40\"><a href=\"#\" onMouseOver=\"document.PrevMo.src=\'http://www.blueb.co.kr/SRC/javascript/image4/PrevMoOn40x40\.jpg\';\" onMouseOut=\"document.PrevMo.src=\'http://www.blueb.co.kr/SRC/javascript/image4/PrevMoOff40x40\.jpg\';\" onClick=\"changedate(\'prevmo\')\"><img name=\"PrevMo\" src=\"http://www.blueb.co.kr/SRC/javascript/image4/PrevMoOff40x40\.jpg\" border=\"0\" alt=\"저번 달\"\/><\/a><\/td>';
	calendarString += '<td bgcolor="#FFFFFF" align=\"center\" width=\"280\" height=\"40\" colspan=\"7\"><b>' + yearNum+'년  ' + wordMonth[monthNum-1]+ '<\/b><\/td>';
// 	calendarString += '<td bgcolor="#FFFFFF" align="center" width="40" height="40"><a href="#" onMouseOver=\"document.NextMo.src=\'http://www.blueb.co.kr/SRC/javascript/image4/NextMoOn40x40\.jpg\';\" onMouseOut=\"document.NextMo.src=\'http://www.blueb.co.kr/SRC/javascript/image4/NextMoOff40x40\.jpg\';\" onClick=\"changedate(\'nextmo\')\"><img name=\"NextMo\" src=\"http://www.blueb.co.kr/SRC/javascript/image4/NextMoOff40x40\.jpg\" border=\"0\" alt=\"다음 달\"\/><\/a><\/td>';
// 	calendarString += '<td bgcolor="#FFFFFF" align="center" width="40" height="40"><a href="#" onMouseOver=\"document.NextYr.src=\'http://www.blueb.co.kr/SRC/javascript/image4/NextYrOn40x40\.jpg\';\" onMouseOut=\"document.NextYr.src=\'http://www.blueb.co.kr/SRC/javascript/image4/NextYrOff40x40\.jpg\';\" onClick=\"changedate(\'nextyr\')\"><img name=\"NextYr\" src=\"http://www.blueb.co.kr/SRC/javascript/image4/NextYrOff40x40\.jpg\" border=\"0\" alt=\"내 년\"\/><\/a><\/td>';
	calendarString += '<\/tr>';
	calendarString += '<tr>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\" style=\"color:red\">일<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\">월<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\">화<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\">수<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\">목<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\">금<\/td>';
	calendarString += '<td bgcolor=\"#FFFFFF\" align=\"center\" width=\"40\" height=\"22\" style=\"color:blue\">토<\/td>';
	calendarString += '<\/tr>';

	thisDate == 1;

	for (var i = 1; i <= 6; i++) {
		calendarString += '<tr>';
		for (var x = 1; x <= 7; x++) {
			daycounter = (thisDate - firstDay)+1;
			thisDate++;
			if ((daycounter > numbDays) || (daycounter < 1)) {
				calendarString += '<td align=\"center\" bgcolor=\"#FFFFFF\" height=\"30\" width=\"40\"> <\/td>';
			} else {
				if (checkevents(daycounter,monthNum,yearNum,i,x) || ((todaysDay == x) && (todaysDate == daycounter) && (todaysMonth == monthNum))){
					if ((todaysDay == x) && (todaysDate == daycounter) && (todaysMonth == monthNum)) {
						calendarString += '<td align=\"center\" bgcolor=\"#AAFFAA\" height=\"30\" width=\"40\"><a href=\"javascript:showevents(' + daycounter + ',' + monthNum + ',' + yearNum + ',' + i + ',' + x + ')\">' + daycounter + '<\/a><\/td>';
					}
 					else	calendarString += '<td align=\"center\" bgcolor=\"#FFFFFF\" height=\"30\" width=\"40\"><a href=\"javascript:showevents(' + daycounter + ',' + monthNum + ',' + yearNum + ',' + i + ',' + x + ')\">' + daycounter + '<\/a><\/td>';
				} else {
					calendarString += '<td align=\"center\" bgcolor=\"#FFFFFF\" height=\"30\" width=\"40\">' + daycounter + '<\/td>';
				}
			}
		}
		calendarString += '<\/tr>';
	}

	calendarString += '<tr><td colspan=\"7\" nowrap align=\"center\" bgcolor=\"#FFFFFF\" width=\"280\" height=\"22\"><a href=\"javascript:changedate(\'return\')\"><b>Show Current Date<\/b><\/a><\/td><\/tr><\/table>';

	var object=document.getElementById('calendar');
	object.innerHTML= calendarString;
	thisDate = 1;
}


function checkevents(day,month,year,week,dayofweek) {
var numevents = 0;
var floater = 0;

	for (var i = 0; i < events.length; i++) {
		if (events[i][0] == "W") {
			if ((events[i][2] == dayofweek)) numevents++;
		}
		else if (events[i][0] == "Y") {
			if ((events[i][2] == day) && (events[i][1] == month)) numevents++;
		}
		else if (events[i][0] == "F") {
			if ((events[i][1] == 3) && (events[i][2] == 0) && (events[i][3] == 0) ) {
				easter(year);
				if (easterday == day && eastermonth == month) numevents++;
			} else {
				floater = floatingholiday(year,events[i][1],events[i][2],events[i][3]);
				if ((month == 5) && (events[i][1] == 5) && (events[i][2] == 4) && (events[i][3] == 2)) {
					if ((floater + 7 <= 31) && (day == floater + 7)) {
						numevents++;
					} else if ((floater + 7 > 31) && (day == floater)) numevents++;
				} else if ((events[i][1] == month) && (floater == day)) numevents++;
			}
		}
		else if ((events[i][2] == day) && (events[i][1] == month) && (events[i][3] == year)) {
			numevents++;
		}
	}

	if (numevents == 0) {
		return false;
	} else {
		return true;
	}
}


function showevents(day,month,year,week,dayofweek) {
var theevent = "";
var floater = 0;

	for (var i = 0; i < events.length; i++) {
		// First we'll process recurring events (if any):
		if (events[i][0] != "") {
			if (events[i][0] == "D") {
				theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
				theevent += events[i][6] + '\n';
				theevent += 'Start Time: ' + events[i][4] + '\n';
				theevent += 'Ending Time: ' + events[i][5] + '\n';
				theevent += 'Description: ' + events[i][7] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
			}
			if (events[i][0] == "W") {
				if ((events[i][2] == dayofweek)) {
				theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
				theevent += events[i][6] + '\n';
				theevent += 'Start Time: ' + events[i][4] + '\n';
				theevent += 'Ending Time: ' + events[i][5] + '\n';
				theevent += 'Description: ' + events[i][7] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events[i][0] == "M") {
			}
			if (events[i][0] == "Y") {
				if ((events[i][2] == day) && (events[i][1] == month)) {
				theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
				theevent += events[i][6] + '\n';
				theevent += 'Start Time: ' + events[i][4] + '\n';
				theevent += 'Ending Time: ' + events[i][5] + '\n';
				theevent += 'Description: ' + events[i][7] + '\n';
				theevent += '\n -------------- \n\n';
				document.forms.eventform.eventlist.value = theevent;
				}
			}
			if (events[i][0] == "F") {
				if ((events[i][1] == 3) && (events[i][2] == 0) && (events[i][3] == 0) ) {
					if (easterday == day && eastermonth == month) {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events[i][6] + '\n';
						theevent += 'Start Time: ' + events[i][4] + '\n';
						theevent += 'Ending Time: ' + events[i][5] + '\n';
						theevent += 'Description: ' + events[i][7] + '\n';
						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					} 
				} else {
					floater = floatingholiday(year,events[i][1],events[i][2],events[i][3]);

					if ((month == 5) && (events[i][1] == 5) && (events[i][2] == 4) && (events[i][3] == 2)) {
						if ((floater + 7 <= 31) && (day == floater + 7)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events[i][6] + '\n';
							theevent += 'Start Time: ' + events[i][4] + '\n';
							theevent += 'Ending Time: ' + events[i][5] + '\n';
							theevent += 'Description: ' + events[i][7] + '\n';
							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						} else if ((floater + 7 > 31) && (day == floater)) {
							theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
							theevent += events[i][6] + '\n';
							theevent += 'Start Time: ' + events[i][4] + '\n';
							theevent += 'Ending Time: ' + events[i][5] + '\n';
							theevent += 'Description: ' + events[i][7] + '\n';
							theevent += '\n -------------- \n\n';
							document.forms.eventform.eventlist.value = theevent;
						}
					} else if ((events[i][1] == month) && (floater == day)) {
						theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
						theevent += events[i][6] + '\n';
						theevent += 'Start Time: ' + events[i][4] + '\n';
						theevent += 'Ending Time: ' + events[i][5] + '\n';
						theevent += 'Description: ' + events[i][7] + '\n';
						theevent += '\n -------------- \n\n';
						document.forms.eventform.eventlist.value = theevent;
					}
				}
		}
		}
		// Now we'll process any One Time events happening on the matching month, day, year:
		else if ((events[i][2] == day) && (events[i][1] == month) && (events[i][3] == year)) {
			theevent += "Events of: \n" + month +'/'+ day +'/'+ year + '\n';
			theevent += events[i][6] + '\n';
			theevent += 'Start Time: ' + events[i][4] + '\n';
			theevent += 'Ending Time: ' + events[i][5] + '\n';
			theevent += 'Description: ' + events[i][7] + '\n';
			theevent += '\n -------------- \n\n';
			document.forms.eventform.eventlist.value = theevent;
		}
	}
	if (theevent == "") document.forms.eventform.eventlist.value = 'No events to show.';
}


function floatingholiday(targetyr,targetmo,cardinaloccurrence,targetday) {
var firstdate = new Date(String(targetmo)+"/1/"+String(targetyr));	// Object Storing the first day of the current month.
var firstday = firstdate.getUTCDay();	// The first day (0-6) of the target month.
var dayofmonth = 0;	// zero out our calendar day variable.

	targetday = targetday - 1;

	if (targetday >= firstday) {
		cardinaloccurrence--;	// Subtract 1 from cardinal day.
		dayofmonth = (cardinaloccurrence * 7) + ((targetday - firstday)+1);
	} else {
		dayofmonth = (cardinaloccurrence * 7) + ((targetday - firstday)+1);
	}
return dayofmonth;
}

</script>

</head>

<body onload="changedate('return')">

<table id="evtcal" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td style="padding: 3px;" align="center" valign="top">
			<div id="calendar"><!--  Dynamically Filled --></div>
		</td>
		<td style="padding: 3px;" valign="top">
				<form id="eventform" name="eventform" action="#" method="get">
				<textarea name="eventlist" cols="25" rows="11" wrap="soft" style=height:250>
				</textarea>
				</form>
		</td>
</tr>
</table>
</body>
</html>
				
				
				
				
				
				
				
				
				
				
				