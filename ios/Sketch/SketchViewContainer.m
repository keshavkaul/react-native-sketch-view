//
//  SketchViewContainer.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "SketchViewContainer.h"

@implementation SketchViewContainer

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self addSketchView:frame];
    return self;
}

-(void) addSketchView:(CGRect)frame
{
    if(_sketchView)
        return;
    _sketchView = [[SketchView alloc] initWithFrame:frame];
    [self addSubview:_sketchView];
}

-(void)openSketchFile:(SketchFile *)file
{
    [self.sketchView setViewImage:[UIImage imageWithContentsOfFile:file.localFilePath]];
}

-(SketchFile *)saveToLocalCache
{
    UIImage *image = [SketchViewContainer imageWithView:self];
    
    NSURL *tempDir = [NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES];
    NSString *fileName = [NSString stringWithFormat:@"sketch_%@.png", [[NSUUID UUID] UUIDString]];
    NSURL *fileURL = [tempDir URLByAppendingPathComponent:fileName];
    
    NSLog(@"fileURL: %@", [fileURL path]);
    
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToURL:fileURL atomically:YES];
    
    SketchFile *sketchFile = [[SketchFile alloc] init];
    sketchFile.localFilePath = [fileURL path];
    sketchFile.size = [image size];
    return sketchFile;
}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
