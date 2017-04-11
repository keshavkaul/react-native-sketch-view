//
//  PathPaint.h
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Paint : NSObject

@property UIColor *color;
@property CGFloat thickness;

-(instancetype)initWithPathPaint:(Paint *) pathPaint;

@end
