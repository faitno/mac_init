//file location see in browser:
//about:support
//Profile Folder
//android folder location: https://github.com/arkenfox/user.js/issues/318#issuecomment-359181951

//firefox telemetry off
//https://github.com/pyllyukko/user.js
//https://gist.github.com/MrYar/751e0e5f3f1430db7ec5a8c8aa237b7
//https://www.howtogeek.com/557929/how-to-see-and-disable-the-telemetry-data-firefox-collects-about-you/
user_pref("browser.fullscreen.autohide", true); //https://superuser.com/a/1181724
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

user_pref("privacy.resistFingerprinting", true); //canvas HTML5 privacy (generate random every)

//user_pref("network.security.esni.enabled", true); //encrypt tls — need more settings to work
user_pref("browser.backspace_action", 2); //backspace not backward to history
user_pref("view_source.wrap_long_lines", true); //word_wrap on view-source
user_pref("network.IDN_show_punycode", false); //show punycode domains as symbols, but not as abracadabra
user_pref("xpinstall.signatures.required", false); //install not signed addons


//Firefox 4 disables two finger pinch/zoom gestures on a Mac. Here is how to make pinch/zoom work again.
user_pref("browser.gesture.pinch.in","cmd_fullZoomReduce");
user_pref("browser.gesture.pinch.in.shift","cmd_fullZoomReset");
user_pref("browser.gesture.pinch.out","cmd_fullZoomEnlarge");
user_pref("browser.gesture.pinch.out.shift","cmd_fullZoomReset");
  
