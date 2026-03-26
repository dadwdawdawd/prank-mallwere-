Set shell = CreateObject("WScript.Shell")

Randomize

' Generate fake IP
fakeIP = Int((255 * Rnd) + 1) & "." & Int((255 * Rnd) + 1) & "." & Int((255 * Rnd) + 1) & "." & Int((255 * Rnd) + 1)

' Generate fake username
names = Array("parker", "parker", "parker", "parker", "parker")
fakeName = names(Int(Rnd * (UBound(names) + 1)))

' Generate fake percent
fakePercent = Int((90 * Rnd) + 10)

shell.Popup "Initializing Connection...", 2, "SYSTEM BREACH", 48
shell.Popup "Target Locked: " & fakeName, 3, "TRACKING USER", 48
shell.Popup "IP Address Found: " & fakeIP, 3, "DATA TRACE", 48
shell.Popup "Location Found: kansas gardner", 3, "GPS LOCKED", 48
shell.Popup "Downloading Passwords... " & fakePercent & "%", 3, "DATA EXTRACTION", 48
shell.Popup "Uploading to Shadow Server...", 3, "TRANSFER ACTIVE", 48
shell.Popup "ERROR: cooked", 3, "im in", 16
shell.Popup "password 1212", 6, "done for", 64
shell.Popup "Initializing Connection...", 2, "SYSTEM BREACH", 48