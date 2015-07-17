//
//  DotButton.h
//  HelloWorld
//
//  Created by ShiMac on 15/7/16.
//  Copyright © 2015年 guoyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum Circle
{
    HEART_TYPE,
    HAND_TYPE,
    FACE_TYPE,
    SART_TYPE

} Circle_Type;


@interface DotButton : UIButton

-(id)initWithFrame:(CGRect)frame withType:(Circle_Type)type;

@end
