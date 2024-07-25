{ ... }: {
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 96;


    "xterm*dynamiccolors" = true;
    "xterm*utf8" = 2;
    "xterm*visualBell" = "off";
    "xterm*highlightSelection" = true;
    "trueXTerm*faceName" = "xft:JetBrainsMono NF:size=13:antialias=true:hinting=true:autohint=false:hintstyle=hintnone:dpi=128";


    "XTerm.termName" = "xterm-256color";
    "XTerm.vt100.locale" = true;
    "XTerm.vt100.metaSendsEscape" = true;
    "XTerm.vt100.saveLines" = 4096;
    "XTerm.vt100.scrollBar" = true;
    "XTerm.vt100.scrollbar.width" = 8;

    "<Btn1Up>" = "select-end(PRIMARY, CLIPBOARD, CUT_BUFFER0)";
    "Ctrl Shift <Key>C" = "copy-selection(CLIPBOARD) \n\\";
    "Ctrl Shift <Key>V" = "insert-selection(CLIPBOARD)";
  };
}
