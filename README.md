
# react-native-sketch-view
A React Native component for touch based drawing supporting iOS and Android. Inspired by the libraries [react-native-sketch](https://github.com/jgrancher/react-native-sketch), [react-native-signature-capture](https://github.com/RepairShopr/react-native-signature-capture).

This component was written to fulfill the following use cases:
1. Basic Touch based drawing for both iOS and android.
2. Shouldn't include any UI Elements for interaction. The UI Elements can be created and customized in react native.
3. Support touch drawing, erasing of part of drawing, clearing drawing, saving of drawn images locally and opening of locally saved images.

## Getting Started

1. `$ npm install react-native-sketch-view --save` or `$ yarn add react-native-sketch-view`
2. `$ react-native link react-native-sketch-view`
3. For iOS, open Application Project in Xcode and find `RNSketchView` project under `Libraries` Folder.
	* Drag `SketchViewContainer.xib` into your application project, adding a folder reference instead of copying.

## Usage
```javascript
import React, { Component } from 'react';
import {
    View,
    Text,
    TouchableHighlight
} from 'react-native';
import SketchView from 'react-native-sketch-view';

const sketchViewConstants = SketchView.constants;

const tools = {};

tools[sketchViewConstants.toolType.pen.id] = {
    id: sketchViewConstants.toolType.pen.id,
    name: sketchViewConstants.toolType.pen.name,
    nextId: sketchViewConstants.toolType.eraser.id
};
tools[sketchViewConstants.toolType.eraser.id] = {
    id: sketchViewConstants.toolType.eraser.id,
    name: sketchViewConstants.toolType.eraser.name,
    nextId: sketchViewConstants.toolType.pen.id
};

class HandNote extends Component {

    constructor(props) {
        super(props);
        this.state = {
            toolSelected: sketchViewConstants.toolType.pen.id
        };
    }

    isEraserToolSelected() {
        return this.state.toolSelected === sketchViewConstants.toolType.eraser.id;
    }

    toolChangeClick() {
        this.setState({toolSelected: tools[this.state.toolSelected].nextId});
    }

    getToolName() {
        return tools[this.state.toolSelected].name;
    }

    onSketchSave(saveEvent) {
        this.props.onSave && this.props.onSave(saveEvent);
    }

    render() {
        return (
            <View style={{flex: 1, flexDirection: 'column'}}>
                <SketchView style={{flex: 1, backgroundColor: 'white'}} ref="sketchRef" 
                selectedTool={this.state.toolSelected} 
                onSaveSketch={this.onSketchSave.bind(this)}
                localSourceImagePath={this.props.localSourceImagePath}/>
				
                <View style={{ flexDirection: 'row', backgroundColor: '#EEE'}}>
                    <TouchableHighlight underlayColor={"#CCC"} style={{ flex: 1, alignItems: 'center', paddingVertical:20 }} onPress={() => { this.refs.sketchRef.clearSketch() }}>
                        <Text style={{color:'#888',fontWeight:'600'}}>CLEAR</Text>
                    </TouchableHighlight>
                    <TouchableHighlight underlayColor={"#CCC"} style={{ flex: 1, alignItems: 'center', paddingVertical:20, borderLeftWidth:1, borderRightWidth:1, borderColor:'#DDD' }} onPress={() => { this.refs.sketchRef.saveSketch() }}>
                        <Text style={{color:'#888',fontWeight:'600'}}>SAVE</Text>
                    </TouchableHighlight>
                    <TouchableHighlight underlayColor={"#CCC"} style={{ flex: 1, justifyContent:'center', alignItems: 'center', backgroundColor:this.isEraserToolSelected() ? "#CCC" : "rgba(0,0,0,0)" }} onPress={this.toolChangeClick.bind(this)}>
						<Text style={{color:'#888',fontWeight:'600'}}>ERASER</Text>
                    </TouchableHighlight>
                </View>
            </View>
        );
    }
}

export default HandNote;
```
## APIs and Props

### APIs
1. `clearSketch()` - Clears the view.
2. `saveSketch()` - Initiates saving of sketch.
3. `changeTool(toolId)` - Changes selected tool.
	* Tool Id can be found using SketchView tooltype constants eg. `SketchView.constants.toolType.pen.id`
#### Tool Types
1. Pen - `SketchView.constants.toolType.pen`
2. Eraser - `SketchView.constants.toolType.eraser`

### Props
1. `selectedTool` - Set the tool id to be selected.
1. `toolColor` - Set color for pen, using CSS colors.
1. `toolThickness` - Set thickness for pen, using integers.
1. `localSourceImagePath` - Local file path of the image.
1. `onSaveSketch(saveArgs)` - Callback when saving is complete.
	* `saveArgs` Is an object having the following properties -
		* `localFilePath` - Local file path of the saved image.
		* `imageWidth` - Width of the saved image.
		* `imageHeight` - Height of the saved image.

## License
[MIT](./LICENSE)
