tell application "Bluetooth Explorer"
	activate
end tell

-- HCI Controller Selector
tell application "System Events"
	click menu item "HCI Controller Selector" of menu 1 of menu bar item "Tools" of menu bar 1 of application process "Bluetooth Explorer"
end tell

-- Make a selection from the popupbutton.
tell application "System Events"
	click pop up button 1 of window "Host Controller Selector" of application process "Bluetooth Explorer"
end tell

delay 1.400338
-- Cambridge Silicon Radio, LocationID: 1A130000
tell application "System Events"
	click menu item "Cambridge Silicon Radio, LocationID: 1A130000" of menu 1 of pop up button 1 of window "Host Controller Selector" of application process "Bluetooth Explorer"
end tell

-- Click the “Activate” button.
tell application "System Events"
	click UI element "Activate" of window "Host Controller Selector" of application process "Bluetooth Explorer"
end tell
delay 5.400338
-- Quit Bluetooth Explorer
tell application "System Events"
	click menu item "Quit Bluetooth Explorer" of menu 1 of menu bar item "Bluetooth Explorer" of menu bar 1 of application process "Bluetooth Explorer"
end tell
