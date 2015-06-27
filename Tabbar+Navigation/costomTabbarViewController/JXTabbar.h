//
//  JXTabbar.h
//  网易彩票练习No2
//
//  Created by xing on 15/5/31.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JXTabbar;
@protocol JXTabbarDelegate <NSObject>
@optional
-(void)selectClick:(JXTabbar *)tabbar selectIndex:(NSInteger)index;

@end
@interface JXTabbar : UIView
@property (nonatomic,weak)id <JXTabbarDelegate> delegate;
- (void)setupWithImg:(NSString *)imgName selImg:(NSString *)selImg;
@end
