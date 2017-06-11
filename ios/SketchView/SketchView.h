//
//  SketchView.h
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Paint.h"
#import "SketchTool.h"

@interface SketchView : UIView

-(void) clear;
-(void)setToolType:(SketchToolType) toolType;
-(void)setToolColor:(NSMutableDictionary *)rgba;
-(void)setToolThickness:(CGFloat)thickness;
-(void)setViewImage:(UIImage *)image;

@end
