
#if __has_include("RCTViewManager.h")
#import "RCTViewManager.h"
#else
#import <React/RCTViewManager.h>
#endif

#import "SketchViewContainer.h"

@interface P41Sketch : RCTViewManager

@property SketchViewContainer *sketchViewContainer;

@end
  
