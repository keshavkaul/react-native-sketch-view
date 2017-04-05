
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.views.image.ReactImageView;
import com.facebook.react.views.view.ReactViewManager;
import com.sketch.view.SketchView;

public class P41SketchViewManager extends SimpleViewManager<SketchView> {

  public static final String REACT_CLASS = "P41SketchView";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  protected SketchView createViewInstance(ThemedReactContext reactContext) {
    return new SketchView(reactContext);
  }


}