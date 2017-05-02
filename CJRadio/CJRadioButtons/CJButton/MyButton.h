//
//  MyButton.h
//  CJRadioDemo
//
//  Created by 李超前 on 2017/4/28.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>


//参考：自定义UIButton http://blog.csdn.net/feisongfeiqin/article/details/50041003
typedef NS_ENUM(NSUInteger, MyButtonImagePosition) {
    MyButtonImagePositionNone,
    MyButtonImagePositionLeft,
    MyButtonImagePositionRight,
    MyButtonImagePositionTop,
    MyButtonImagePositionBottom
};


@interface MyButton : UIButton

@property (nonatomic, assign) MyButtonImagePosition imagePosition;

@end
