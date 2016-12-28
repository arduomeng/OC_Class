//
//  ProgressBarView.m
//  ProgressBar1
//
//  Created by arduomeng on 16/11/18.
//  Copyright © 2016年 arduomeng. All rights reserved.
//

#import "ProgressBarView.h"

@interface ProgressBarView ()

@property (nonatomic, strong) CALayer *bgLayer;
@property (nonatomic, strong) CALayer *progressLayer;


@end

@implementation ProgressBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    
        _progress = 0;
        
        _bgLayer = [[CALayer alloc] init];
        _bgLayer.bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _bgLayer.position = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
        _bgLayer.borderWidth = 1;
        _bgLayer.borderColor = [UIColor orangeColor].CGColor;
        _bgLayer.cornerRadius = frame.size.height * 0.5;
        _bgLayer.masksToBounds = YES;
        [self.layer addSublayer:_bgLayer];
        
        _progressLayer = [[CALayer alloc] init];
        _progressLayer.backgroundColor = [UIColor orangeColor].CGColor;
        _progressLayer.bounds = CGRectMake(0, 0, 0, frame.size.height);
        _progressLayer.position = CGPointMake(0, 0);
        _progressLayer.anchorPoint = CGPointMake(0, 0);
        _progressLayer.cornerRadius = frame.size.height * 0.5;
        _progressLayer.masksToBounds = YES;
        [self.layer addSublayer:_progressLayer];
    }
    
    return self;
}

- (void)setProgress:(float)progress{
    
    if (progress < 0 || progress - 1 >= 1E-6 ) {
        return;
    }
    
    _progress = progress;
    
    float width = progress * self.frame.size.width;
    CGRect bound = _progressLayer.bounds;
    bound.size.width = width;
    _progressLayer.bounds = bound;
}

@end
