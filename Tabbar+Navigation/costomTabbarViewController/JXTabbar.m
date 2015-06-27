//
//  JXTabbar.m
//  网易彩票练习No2
//
//  Created by xing on 15/5/31.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "JXTabbar.h"
#import "JXTabbarButton.h"
@interface JXTabbar()
@property (nonatomic,strong)JXTabbarButton *selectBtn;
@end
@implementation JXTabbar


- (void)setupWithImg:(NSString *)imgName selImg:(NSString *)selImg {
   
        JXTabbarButton *btn =[JXTabbarButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        [btn setBackgroundImage: [UIImage imageNamed:selImg] forState:UIControlStateSelected];
        [self addSubview:btn];
        [btn addTarget: self  action:@selector(btnSelect:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)layoutSubviews {
    //设置按钮的frame
    CGFloat btnW = self.bounds.size.width/ self.subviews.count;
    CGFloat btnH = self.bounds.size.height ;
    CGFloat btnY = 0;
    
    for (int i = 0; i< self.subviews.count; i++) {
      
        JXTabbarButton *btn= self.subviews[i];
          btn.tag = i;
        CGFloat btnX = i * btnW;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        if (i == 0) {
            btn.selected = YES;
            self.selectBtn = btn;
        }
    }
   }

- (void)btnSelect:(JXTabbarButton *)btn{
    self.selectBtn.selected =NO;
    btn.selected = YES;
    self.selectBtn = btn;
    if ([self.delegate respondsToSelector:@selector(selectClick:selectIndex:)]) {
        [self.delegate selectClick:self selectIndex:btn.tag];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
