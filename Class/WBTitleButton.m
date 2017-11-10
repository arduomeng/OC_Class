//
//  WBTitleButton.m
//  56新浪微博01
//
//  Created by Mac OS X on 15/9/24.
//  Copyright (c) 2015年 Mac OS X. All rights reserved.
//  自定义TitleButton按钮

#import "WBTitleButton.h"
#import "UIView+Extensions.h"

#define WBmargin 10
#define titleSize 17
#define titleColor [UIColor blackColor]

@implementation WBTitleButton


- (instancetype)init
{
    if (self = [super init]) {
        
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:titleSize];
        [self setImage:[UIImage imageNamed:@"btn_list_down"] forState:UIControlStateNormal];
        
//设置背景色，测试用
        [self.imageView setBackgroundColor:[UIColor redColor]];
        [self.titleLabel setBackgroundColor:[UIColor blueColor]];
        [self setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.2]];
        
    }
    return  self;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width += WBmargin;
    [super setFrame:frame];
}

//对按钮中的子控件重新布局,调整按钮内部控件的位置
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    //将之前布局好的子控件重新设置x的值，使图片在文字右边
    self.titleLabel.x = self.imageView.x;
    
    //通过重写setFrame方法，拦截设置按钮尺寸的过程
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + WBmargin;
    
    
}

//文字修改后，设置按钮的大小自适应
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    [self sizeToFit];
}

@end
