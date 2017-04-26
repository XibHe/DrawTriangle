//
//  MaskImageViewController.m
//  DrawTriangle
//
//  Created by Peng he on 2017/4/26.
//  Copyright © 2017年 Peng he. All rights reserved.
//

#import "MaskImageViewController.h"

@interface MaskImageViewController ()

@end

@implementation MaskImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIImage *testImage = [self maskImage];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:testImage];
    imageView.frame = CGRectMake(screenWidth / 2 - 50, 300, 100, 100);
    [self.view addSubview:imageView];
}

- (UIImage *)maskImage
{
    // start with an image
    UIImage * fooImage = [UIImage imageNamed:@"backImage"];//[UIImage imageNamed:@"foo.png"];
    CGRect imageRect = CGRectMake(0, 0, fooImage.size.width, fooImage.size.height);
    // set the implicit graphics context ("canvas") to a bitmap context for images
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, 0.0);
    // create a bezier path defining rounded corners
    UIBezierPath * path = [UIBezierPath bezierPathWithRect:imageRect];
    CGFloat radius = fooImage.size.width / 2.5;
    CGFloat _radius = radius;
    //construct your shaped path
    [path moveToPoint:CGPointMake(0, 0)];
    [path addArcWithCenter:CGPointMake(radius, radius) radius:_radius startAngle:M_PI endAngle:3 * M_PI / 2 clockwise:TRUE];
    [path moveToPoint:CGPointMake(fooImage.size.width, 0)];
    [path addArcWithCenter:CGPointMake(fooImage.size.width - radius, radius) radius:_radius startAngle:3 * M_PI / 2 endAngle:2 * M_PI clockwise:TRUE];
    [path moveToPoint:CGPointMake(fooImage.size.width, fooImage.size.height)];
    [path addArcWithCenter:CGPointMake(fooImage.size.width - radius, fooImage.size.height - radius) radius:_radius startAngle:0 endAngle:M_PI / 2 clockwise:TRUE];
    [path moveToPoint:CGPointMake(0, fooImage.size.height)];
    [path addArcWithCenter:CGPointMake(radius, fooImage.size.height - radius) radius:_radius startAngle:M_PI / 2 endAngle:M_PI clockwise:TRUE];
    path.flatness = 1000;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    // use this path for clipping in the implicit context
    [path addClip];
    // draw the image into the implicit context
    [fooImage drawInRect:imageRect];
    // save the clipped image from the implicit context into an image
    UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
    // cleanup
    UIGraphicsEndImageContext();
    return maskedImage;
}

@end
