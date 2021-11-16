//append timestamp if snapshot
let fs = require('fs');

var args = process.argv.slice(2);
var packageFilename = args[0] + '/package.json';

if (fs.existsSync(packageFilename)){
    var package = require(packageFilename);
    let currentVersion = package.version;

    if(currentVersion.endsWith("SNAPSHOT")){
        let newVersion = currentVersion + "." + Date.now();
        package.version = newVersion;
        fs.writeFileSync(packageFilename, JSON.stringify(package, null, 2));
        console.log('Version updated', currentVersion, '=>', newVersion);
    }else if(currentVersion.match(/SNAPSHOT.([\d]{10,})$/i)){
        let currentVersionPart = currentVersion.match(/^([\d\.]+)-SNAPSHOT/i);
        if(currentVersionPart.length > 1){
            let newVersion = currentVersionPart[0] + "." + Date.now();
            package.version = newVersion;
            fs.writeFileSync(packageFilename, JSON.stringify(package, null, 2));
            console.log('SNAPSHOT version replaced ', currentVersion, '=>', newVersion);
        }
    }else{
        console.log('Version is not a SNAPSHOT');
    }
}