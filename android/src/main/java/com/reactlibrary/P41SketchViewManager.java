
package com.reactlibrary;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.sketch.SketchViewContainer;

public class P41SketchViewManager extends SimpleViewManager<SketchViewContainer> {

  public static final String REACT_CLASS = "P41SketchView";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  protected SketchViewContainer createViewInstance(ThemedReactContext reactContext) {
    return new SketchViewContainer(reactContext);
  }

}