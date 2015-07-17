//
//  DotButton.m
//  HelloWorld
//
//  Created by ShiMac on 15/7/16.
//  Copyright © 2015年 guoyan. All rights reserved.
//



#import "DotButton.h"

@interface DotButton ()
{
    CAShapeLayer    *circleLayer_;      //外围圆
    CAShapeLayer    *maskCircleLayer_;  //空心圆
    CAShapeLayer    *imageLayer_;       //基本图形
    CGColorRef      circleColor_;       //颜色
    UIImage         *image_;
    NSMutableArray  *lineLayerAry_;     //线条数组
    
    
    CAKeyframeAnimation *circleTransform_;  //外围圆
    CAKeyframeAnimation *maskTransform_;
    CAKeyframeAnimation *imageTransform_;
    
    CAKeyframeAnimation *lineStart;
    CAKeyframeAnimation *lineEnd;
    CAKeyframeAnimation *lineOpacity;
    
}
@end

@implementation DotButton


-(id)initWithFrame:(CGRect)frame withType:(Circle_Type)type
{
    if (self=[super initWithFrame:frame]) {
        
        if (type==HEART_TYPE) {
            
            image_              =   [UIImage imageNamed:@"heart.png"];
            
        }else if(type==SART_TYPE){
            
            image_              =   [UIImage imageNamed:@"star.png"];
            
        }else if(type==FACE_TYPE){
            
            image_              =   [UIImage imageNamed:@"smile.png"];
            
        }else if(type==HAND_TYPE){
    
            image_              =   [UIImage imageNamed:@"like.png"];
        }
        
        circleColor_        =   [UIColor colorWithRed:255/255 green:172/255 blue:51/255 alpha:1.0].CGColor;

        //添加外圆
        circleLayer_            =   [CAShapeLayer layer];
        circleLayer_.frame     =   self.layer.bounds;
        circleLayer_.path       =   [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        circleLayer_.fillColor  =   circleColor_;
        circleLayer_.transform  =   CATransform3DMakeScale(0, 0, 1);
        [self.layer addSublayer:circleLayer_];
        
        //添加空心圆
        maskCircleLayer_            =   [CAShapeLayer layer];
        maskCircleLayer_.frame     =   self.bounds;
        UIBezierPath *circlePath    =   [UIBezierPath bezierPathWithRect:self.bounds];
        [circlePath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:0.1 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        maskCircleLayer_.path       =   circlePath.CGPath;
        maskCircleLayer_.fillRule = kCAFillRuleEvenOdd;
        maskCircleLayer_.fillColor  =   circleColor_;
        
        circleLayer_.mask           =   maskCircleLayer_;
        
        //添加图片
        imageLayer_                 =   [CAShapeLayer layer];
        imageLayer_.frame           =   self.bounds;
        imageLayer_.fillColor       =   circleColor_;
        imageLayer_.path            =   [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        
        CALayer    *layer           =   [CALayer layer];
        layer.frame                =   self.bounds;
        layer.contents              =   CFBridgingRelease(image_.CGImage);
        imageLayer_.mask            =   layer;
        [self.layer addSublayer:imageLayer_];
        
        //添加线条
        lineLayerAry_               =   [[NSMutableArray alloc] initWithCapacity:0];
        for (NSInteger index=0; index < 5; index++) {
            
            CAShapeLayer *line      =   [CAShapeLayer layer];
            line.frame             =   self.bounds;
            line.strokeColor        =   circleColor_;
            line.fillColor          =   circleColor_;
            line.strokeStart        =   0;
            line.opacity            =   0;
            line.strokeEnd          =   0;
            line.lineWidth          =   1;
            UIBezierPath *path      =   [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(self.frame.size.width/2, self.frame.size.height/4)];
            [path addLineToPoint:CGPointMake(self.frame.size.width/2,0-self.frame.size.height/4)];
            [path closePath];
            line.path               =   path.CGPath;
            line.transform          =   CATransform3DMakeRotation(M_PI*2 / 5 * index, 0, 0, 1.0);
            
            [self.layer addSublayer:line];
            [lineLayerAry_ addObject:line];
            
        }
        
        [self createAnimation];
        
        
        
    }
    
    return self;
}


-(void)createAnimation
{
    
    circleTransform_=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    circleTransform_.duration=0.3;
    circleTransform_.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0,  0.0,  1.0)],    //  0/10
                                [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5,  0.5,  1.0)],    //  0/10
                                [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0,  1.0,  1.0)],    //  0/10
                                [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3,  1.3,  1.0)],    //  0/10
                                [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5,  1.5,  1.0)]];    //  0/10
    
    maskTransform_=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    maskTransform_.duration=0.4;
    maskTransform_.values=@[[NSValue valueWithCATransform3D:CATransform3DIdentity],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0*self.frame.size.width,  1.0*self.frame.size.height,  1.0)],    //  0/10
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(4.3*self.frame.size.width,  4.3*self.frame.size.height,  1.0)],    //  0/10
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(5*self.frame.size.width,  5*self.frame.size.height,  1.0)]
                            ];    //  0/10
    
    imageTransform_=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    imageTransform_.duration=0.8;
    imageTransform_.values=@[
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0,     0,    1.0)],    //  0/10
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.3,   0.3,  1.0)],    //  0/10
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.3,   1.3,  1.0)],    //  0/10
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0,   1.0,  1.0)],    //  0/10
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1,   1.1,  1.0)],    //  0/10
                             [NSValue valueWithCATransform3D:CATransform3DIdentity]];   //  0/1
    
    lineStart=[CAKeyframeAnimation animationWithKeyPath:@"strokeStart"];
    lineStart.duration=1;
    lineStart.values=@[@(0),
                       @(0.1),
                       @(0.2),
                       @(0.3),
                       @(0.4),
                       @(0.5),
                       @(1)];
    
    lineOpacity=[CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    lineOpacity.duration=0.8;
    lineOpacity.values=@[@(1),@(0)];

    lineEnd=[CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    lineEnd.duration=1;
    lineEnd.values=@[@(0.0),
                     @(0.2),
                     @(0.3),
                     @(0.4),
                     @(0.5),
                     @(0.6),
                     @(1)];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        imageLayer_.fillColor=[UIColor colorWithRed:255/255 green:172/255 blue:51/255 alpha:1.0].CGColor;;
        
        [CATransaction begin];
        [circleLayer_ addAnimation:circleTransform_ forKey:@"circle"];
        [maskCircleLayer_ addAnimation:maskTransform_ forKey:@"ddd"];
        [imageLayer_ addAnimation:imageTransform_ forKey:@"ddd"];
        for (NSInteger index=0; index<5; index++) {
            
            CAShapeLayer *line=[lineLayerAry_ objectAtIndex:index];
            [line addAnimation:lineStart forKey:@"start"];
            [line addAnimation:lineEnd forKey:@"ddda"];
            [line addAnimation:lineOpacity forKey:@"sdd"];
        }
        
        
        [CATransaction commit];

    }else{
        
        
        imageLayer_.fillColor=[UIColor colorWithRed:3/255 green:43/255 blue:3/255 alpha:1.0].CGColor;
        
    }
}



@end
