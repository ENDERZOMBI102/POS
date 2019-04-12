Dim message, sapi 
Set sapi=CreateObject("sapi.spvoice")
if WScript.Arguments.Count = 0 then
    WScript.Echo "Parametri Mancanti"
	WScript.Echo "immetti una parola e io la diro' usa il CMD o il menu' start per chiamare il file e scrivere accanto il parametro"
else
    Do Until val = WScript.Arguments.Count
		sapi.Speak WScript.Arguments(val)
		val=val+1
	loop
end if