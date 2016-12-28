//
//  DelayTouchScrollView.m
//  VideoShow
//
//  Created by arduomeng on 16/11/18.
//  Copyright © 2016年 energy. All rights reserved.
//

#import "DelayTouchScrollView.h"

@implementation DelayTouchScrollView

// 拖动ScrollView时触发 决定手势是否取消传递到view上
// 当拖动手势在button上时取消传递到button 上
- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if ([view isKindOfClass:[UIButton class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}


// delaysContentTouches
/*
 布尔类型，默认值为YES。值为YES时，UIScrollView会在接收到手势时延迟150ms来判断该手势是否能够出发UIScrollView的滑动事件；
                    值为NO时，UIScrollView会立马将接收到的手势分发到子视图上。
 只设置这个属性会导致，滑动手势起始在按钮上时无法滚动 因此需要重写touchesShouldCancelInContentView方法
 */
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.delaysContentTouches = NO;
    
    // tableView 进一步处理
    /*
    for (id view in self.subviews) {
        if ([NSStringFromClass([view class]) isEqualToString:@"UITableViewWrapperView"]) {
            if ([view isKindOfClass:[UIScrollView class]]) {
                UIScrollView *scroll = (UIScrollView *)view;
                scroll.delaysContentTouches = NO;
            }
            break;
        }
    }*/
}

@end
