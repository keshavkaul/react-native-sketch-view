
# react-native-sketch

## Getting started

`$ npm install react-native-sketch --save`

### Mostly automatic installation

`$ react-native link react-native-sketch`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-sketch` and add `P41Sketch.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libP41Sketch.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.P41SketchPackage;` to the imports at the top of the file
  - Add `new P41SketchPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-sketch'
  	project(':react-native-sketch').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-sketch/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-sketch')
  	```


## Usage
```javascript
import P41Sketch from 'react-native-sketch';

// TODO: What to do with the module?
P41Sketch;
```
  