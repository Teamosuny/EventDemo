//
//  testButton.m
//  EventDemo
//
//  Copyright © 2019 hycrazyfish. All rights reserved.
//

#import "testButton.h"

@implementation testButton

#pragma mark --事件响应的两个方法
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断按钮是否可以接收事件响应
    if (!self.userInteractionEnabled || [self isHidden] || self.alpha <= 0.01) {
        return nil;
    }
    if ([self pointInside:point withEvent:event]) {
        //遍历当前对象的子视图
        __block UIView *hit = nil;
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //坐标转化
            CGPoint vonvertPoint = [self convertPoint:point fromView:obj];
            //调用子视图的hittest方法
            hit = [obj hitTest:vonvertPoint withEvent:event];
            //如果找到了接受事件的对象,则停止遍历
            if (hit) {
                *stop = YES;
            }
        }];
        if (hit) {
            return hit;
        }else{
            return self;
        }
    }else{
        return nil;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGFloat x1 = point.x;
    CGFloat y1 = point.y;
    
    CGFloat x2 = self.frame.size.width / 2.0;
    CGFloat y2 = self.frame.size.height / 2.0;
    
    double dis = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2)*(y1 - y2));
    //在以当前控件中心为圆心半径是当前控件的宽度的院内
    if (dis < self.frame.size.width / 2.0) {
        return YES;
    }else{
        NSLog(@"这里不是事件响应区域");
        return NO;
    }
}

@end
