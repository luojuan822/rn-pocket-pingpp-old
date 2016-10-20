
import {NativeModules, Platform} from 'react-native';
// console.log(NativeModules)
var invariant = require('invariant');
const { PingPayManager } = NativeModules;

console.log("PingPayManager===========");
console.log(PingPayManager);

if (Platform.OS === 'ios') {
    invariant(PingPayManager,
            'Add PingPayManager.h and PingPayManager.m to your Xcode project');
} else if (Platform.OS === 'android') {
    invariant(PingPayManager, 'Import libraries to android "rnpm link"');
} else {
    invariant(PingPayManager, "Invalid platform");
}

var functions = [
	'setDebugMode',
	'handleOpenURLInIOS8',
	'handleOpenURLInIOS9',
	'createPayment'
];

module.exports = {}
for (var i=0; i < functions.length; i++) {
    module.exports[functions[i]] = PingPayManager[functions[i]];
}