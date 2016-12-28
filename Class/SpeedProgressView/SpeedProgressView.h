//
//  SpeedProgressView.h
//  xx
//
//  Created by arduomeng on 16/11/25.
//  Copyright © 2016年 arduomeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SpeedProgressView;
@protocol SpeedProgressViewDelegate <NSObject>

- (void)SpeedProgressView:(SpeedProgressView *)speedProgressView speed:(float)speed;

@end

@interface SpeedProgressView : UIView

@property (nonatomic, assign) float speed;
@property (nonatomic, weak) id <SpeedProgressViewDelegate> delegate;

@end
