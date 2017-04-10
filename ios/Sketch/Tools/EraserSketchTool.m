//
//  EraserSketchTool.m
//  Sketch
//
//  Created by Keshav on 08/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "EraserSketchTool.h"
#import "Paint.h"

@implementation EraserSketchTool
{
    Paint *paint;
}

-(instancetype)initWithTouchView:(UIView *)touchView
{
    self = [super initWithTouchView:touchView];
    
    paint = [[Paint alloc] init];
    paint.color = [UIColor clearColor];
    
    [self setToolThickness:10];
    
    [self.path setLineCapStyle:kCGLineCapRound];
    [self.path setLineJoinStyle:kCGLineJoinRound];
    
    return self;
}

-(void)render
{
    [paint.color setStroke];
    [self.path strokeWithBlendMode:kCGBlendModeClear alpha:0];
}

-(void)setToolThickness:(CGFloat)thickness
{
    paint.thickness = thickness;
    [self.path setLineWidth:thickness];
}

-(CGFloat)getToolThickness
{
    return paint.thickness;
}

@end
