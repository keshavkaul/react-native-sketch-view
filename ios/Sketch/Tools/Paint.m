//
//  PathPaint.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "Paint.h"

@implementation Paint


-(instancetype)initWithPathPaint:(Paint *) pathPaint
{
    self = [super init];
    self.color = [UIColor colorWithCGColor:[pathPaint.color CGColor]];
    self.thickness = pathPaint.thickness;
    return self;
}


@end
