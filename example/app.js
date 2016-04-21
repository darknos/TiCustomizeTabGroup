// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
//
var TiCustomizeTabGroup = require('ua.com.ipublisher.customize.tab.group');
Ti.API.info("module is => " + TiCustomizeTabGroup);

TiCustomizeTabGroup.customizeTabSelectedImage("/images/tab_select_indicator.png");

var win1 = Ti.UI.createWindow({
    backgroundColor: 'blue',
    title: 'Blue'
});
win1.add(Ti.UI.createLabel({text: 'I am a blue window.'}));

var win2 = Ti.UI.createWindow({
    backgroundColor: 'red',
    title: 'Red'
});
win2.add(Ti.UI.createLabel({text: 'I am a red window.'}));

var tab1 = Ti.UI.createTab({
    window: win1,
    title: 'Blue'
}),
tab2 = Ti.UI.createTab({
    window: win2,
    title: 'Red'
}),
tabGroup = Ti.UI.createTabGroup({
    tabs: [tab1, tab2]
});
tabGroup.open();

// TODO: write your module tests here
