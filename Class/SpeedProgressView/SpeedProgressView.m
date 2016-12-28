//
//  SpeedProgressView.m
//  xx
//
//  Created by arduomeng on 16/11/25.
//  Copyright © 2016年 arduomeng. All rights reserved.
//

#import "SpeedProgressView.h"
@interface SpeedProgressView ()
@property (weak, nonatomic) IBOutlet UISlider *mainSlider;

@property (nonatomic, strong) NSArray *progressArr;

@property (nonatomic, strong) UILabel *labela;
@property (nonatomic, strong) UILabel *labelb;
@property (nonatomic, strong) UILabel *labelc;
@property (nonatomic, strong) UILabel *labeld;
@property (nonatomic, strong) UILabel *labele;


@end

@implementation SpeedProgressView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    _mainSlider.minimumValue = 0;
    _mainSlider.maximumValue = 1;
    [_mainSlider setThumbImage:[UIImage imageNamed:@"slider_handle"] forState:UIControlStateNormal];
    [_mainSlider setThumbImage:[UIImage imageNamed:@"slider_handle"] forState:UIControlStateHighlighted];
    
    [_mainSlider addTarget:self action:@selector(sliderTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [_mainSlider addTarget:self action:@selector(sliderTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
    [_mainSlider addTarget:self action:@selector(sliderTouchUp:) forControlEvents:UIControlEventTouchCancel];
    
    _progressArr = @[@0.25, @0.3, @0.35, @0.4, @0.45, @0.5, @0.6, @0.7, @0.8, @0.9, @1, @1.2, @1.4, @1.6, @1.8, @2, @2.4, @2.8, @3.2, @3.6, @4];
    
    _labela = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 0, 0)];
    _labela.text = @"1/4x";
    _labela.textColor = [UIColor whiteColor];
    _labela.font = [UIFont systemFontOfSize:11];
    _labela.textAlignment = NSTextAlignmentCenter;
    [_labela sizeToFit];
    [self addSubview:_labela];
    _labelb = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 0, 0)];
    _labelb.text = @"1/2x";
    _labelb.textColor = [UIColor whiteColor];
    _labelb.font = [UIFont systemFontOfSize:11];
    _labelb.textAlignment = NSTextAlignmentCenter;
    [_labelb sizeToFit];
    [self addSubview:_labelb];
    _labelc = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 0, 0)];
    _labelc.text = @"1x";
    _labelc.textColor = [UIColor whiteColor];
    _labelc.font = [UIFont systemFontOfSize:11];
    _labelc.textAlignment = NSTextAlignmentCenter;
    [_labelc sizeToFit];
    [self addSubview:_labelc];
    _labeld = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 0, 0)];
    _labeld.text = @"2x";
    _labeld.textColor = [UIColor whiteColor];
    _labeld.font = [UIFont systemFontOfSize:11];
    _labeld.textAlignment = NSTextAlignmentCenter;
    [_labeld sizeToFit];
    [self addSubview:_labeld];
    _labele = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, 0, 0)];
    _labele.text = @"4x";
    _labele.textColor = [UIColor whiteColor];
    _labele.font = [UIFont systemFontOfSize:11];
    _labele.textAlignment = NSTextAlignmentCenter;
    [_labele sizeToFit];
    [self addSubview:_labele];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width * 0.25;
    CGPoint center = _labela.center;
    center.x = 0;
    _labela.center = center;
    
    center = _labelb.center;
    center.x = w;
    _labelb.center = center;
    
    center = _labelc.center;
    center.x = w * 2;
    _labelc.center = center;
    
    center = _labeld.center;
    center.x = w * 3;
    _labeld.center = center;
    
    center = _labele.center;
    center.x = w * 4;
    _labele.center = center;
}

- (void)setSpeed:(float)speed{
    _speed = speed;
    
    NSNumber *speedNum = [NSNumber numberWithFloat:_speed];
    NSUInteger index = [_progressArr indexOfObject:speedNum];
    
    _mainSlider.value = index * 0.05;
}

- (IBAction)sliderValueChanged:(id)sender {
    
    
}


- (void)sliderTouchUp:(UISlider *)sender{
    
    int realPosition = 0;
    float unit = 0.05;
    // 判断最终位置
    float value = sender.value;
    int quotient = (int)(value / unit);
    float remainder = value / unit - quotient;
    if (remainder >= 0.025) {
        realPosition = quotient + 1;
    }else{
        realPosition = quotient;
    }
    sender.value = realPosition * unit;
    // 判断位置是否有变动
    if ([_progressArr[realPosition] floatValue] == _speed) {
        return;
    }
    
    _speed = [_progressArr[realPosition] floatValue];
    // 变动则传递代理
    NSLog(@"sliderTouchUp %d", realPosition);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(SpeedProgressView:speed:)]) {
        [self.delegate SpeedProgressView:self speed:_speed];
    }
}


@end
