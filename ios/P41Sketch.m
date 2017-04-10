
#import "P41Sketch.h"
#import "SketchViewContainer.h"

@implementation P41Sketch

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

-(UIView *)view
{
    SketchViewContainer *container = [[[NSBundle mainBundle] loadNibNamed:@"SketchViewContainer" owner:self options:nil] firstObject];
    return container;
}

@end
  
