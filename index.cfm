
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="Developer" content="tectrics">
<meta name="ProgId" content="Jones">
</head>

<SCRIPT LANGUAGE="JavaScript">
function infoscroll(seed,looped)
{
  var text1  = "   When anyone, anywhere       ";
  var text2  = "   reaches out for help       ";        
  var text3  = "   I want        ";         
  var text4  = "   the hand of AA.       ";
  var text5  = "   to be there       ";        
  var text6  = "   and for that     ";        
  var text7  = "   I am Responsible       ";        
  var text8  = "   ..............       ";
  var msg=text1+text2+text3+text4+text5+text6+text7+text8;
  var putout = " ";
  var c   = 1;

  if (looped > 99) 
  {  window.status="<Thanks for visiting!>";  }
  else if (seed > 100) 
  {
     seed--;
     var cmd="infoscroll(" + seed + "," + looped + ")";
     timerTwo=window.setTimeout(cmd,100);
  }
  else if (seed <= 100 && seed > 0) 
  {
    for (c=0 ; c < seed ; c++) 
    {  putout+=" ";  }
    putout+=msg.substring(0,100-seed);	
    seed--;
    var cmd="infoscroll(" + seed + "," + looped + ")";
    window.status=putout;
    timerTwo=window.setTimeout(cmd,100);
  }
  else if (seed <= 0) 
  {
    if (-seed < msg.length) 
    {
      putout+=msg.substring(-seed,msg.length);
      seed--;
      var cmd="infoscroll(" + seed + "," + looped + ")";
      window.status=putout;
      timerTwo=window.setTimeout(cmd,100); // 100
    }
    else 
    {
      window.status=" ";
      looped += 1;
      var cmd = "infoscroll(100," + looped + ")";
      timerTwo=window.setTimeout(cmd,75); // 75
    }
  }
}
// -->

<!--
infoscroll(100,1)
// -->
</script>
<frameset framespacing="0" border="0" cols="1,*" frameborder="0">
    <frame name="contents"
  		 target="main"
		 src="splash.cfm"
		 scrolling="yes"
		 noresize>
    <frame name="main" src="splash.cfm">
    <noframes>
    <body>
    <p>This page uses frames, but your browser doesn't support them.</p>
    </body>
    </noframes>
</frameset>
