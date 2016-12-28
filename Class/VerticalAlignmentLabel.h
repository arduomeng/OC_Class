//
//  VerticalAlignmentLabel.h
//  VideoShow
//
//  Created by arduomeng on 16/12/14.
//  Copyright © 2016年 energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticalAlignmentLabel : UILabel
typedef enum
{
    VerticalAlignmentTop=0,
    VerticalAlignmentMiddle,//default
    VerticalAlignmentBottom,
    
}VerticalAlignment;


@property(nonatomic)VerticalAlignment verticalAlignment;
@end
