//
//  SketchViewContainer.m
//  Sketch
//
//  Created by Keshav on 06/04/17.
//  Copyright © 2017 Particle41. All rights reserved.
//

#import "SketchViewContainer.h"

@implementation SketchViewContainer

-(BOOL)openSketchFile:(NSString *)localFilePath
{
    UIImage *image = [UIImage imageWithContentsOfFile:localFilePath];
    if(image) {
        [self.sketchView setViewImage:image];
        return YES;
    }
    return NO;
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
    UIGraphicsBeginImageContext(view.bounds.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    const CGFloat mask[6] = { 222, 255, 222, 255, 222, 255 };
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRef imageMask = CGImageCreateWithMaskingColors(img.CGImage, mask);
    UIImage * maskedImage = UIGraphicsGetImageFromCurrentImageContext();
    CGImageRelease(imageMask);
    UIGraphicsEndImageContext();
    return maskedImage;
}

@end
