//
//  SketchView.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "SketchView.h"
#import "PenSketchTool.h"
#import "EraserSketchTool.h"

@implementation SketchView
{
    SketchTool *currentTool;
    SketchTool *penTool;
    SketchTool *eraseTool;
    
    UIImage *incrementalImage;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self initialize];
    return self;
}

- (void) initialize
{
    [self setMultipleTouchEnabled:NO];
    penTool = [[PenSketchTool alloc] initWithTouchView:self];
    eraseTool = [[EraserSketchTool alloc] initWithTouchView:self];
    
    [self setToolType:SketchToolTypePen];
    
    [self setBackgroundColor:[UIColor clearColor]];
}

-(void)setToolType:(SketchToolType) toolType
{
    switch (toolType) {
        case SketchToolTypePen:
            currentTool = penTool;
            break;
        case SketchToolTypeEraser:
            currentTool = eraseTool;
            break;
        default:
            currentTool = penTool;
            break;
    }
}

-(void)setToolColor:(NSMutableDictionary *)rgba
 {
     float r = [[rgba objectForKey:@"r"] floatValue];
     float g = [[rgba objectForKey:@"g"] floatValue];
     float b = [[rgba objectForKey:@"b"] floatValue];
     float a = [[rgba objectForKey:@"a"] floatValue];
     [(PenSketchTool *)penTool setToolColor:[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]];
 }

-(void)setViewImage:(UIImage *)image
{
    incrementalImage = image;
    [self setNeedsDisplay];
}

-(void) clear
{
    incrementalImage = nil;
    [currentTool clear];
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [incrementalImage drawInRect:rect];
    [currentTool render];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesEnded:touches withEvent:event];
    [self takeSnapshot];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [currentTool touchesCancelled:touches withEvent:event];
    [self takeSnapshot];
}

-(void)takeSnapshot
{
    [self setViewImage:[self drawBitmap]];
    [currentTool clear];
}

-(UIImage *)drawBitmap
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self drawRect:self.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
