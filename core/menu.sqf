private ["_info"];

player createDiarySubject ["FW_Menu", "Kobold Framework"];

_info = "
<font size='18'>A derivative of the Olsen Framework!</font><br/>
The Kobold Framework is a derivative of the Olsen Framework, mangled by TinfoilHate. Nobody should use it.
<br/>
<br/>The Olsen Framework is a simple framework designed for ArmA 3. It supports modules and is easy to configure.<br/>
<br/>
Find out more about the Olsen Framework on GitHub.<br/>
github.com/dklollol/Olsen-Framework-Arma-3<br/>
<br/>
Current Version: 3.3.3
";

player createDiaryRecord ["FW_Menu", ["Framework Info", _info]];
