//
//  VeritalButton.m
//  VideoShow
//
//  Created by arduomeng on 16/11/14.
//  Copyright © 2016年 energy. All rights reserved.
//

#import "VeritalButton.h"

@implementation VeritalButton

#define kRatio 0.8

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont systemFontOfSize:12]];
    
    
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat x = 0;
    CGFloat y = 0;
//    CGFloat h = self.bounds.size.height * kRatio;
    CGFloat w = self.bounds.size.width;
    CGFloat h = 25;
    self.imageView.frame = CGRectMake(x, y, w, h);
    self.titleLabel.frame = CGRectMake(0, h, w, self.bounds.size.height - h);
}

- (void)setHighlighted:(BOOL)highlighted{
    
}

@end
