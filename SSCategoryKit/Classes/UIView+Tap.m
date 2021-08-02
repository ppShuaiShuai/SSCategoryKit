//
//  UIView+Tap.m
//  SSCategoryKit
//
//  Created by zhangshuai on 2021/6/4.
//

#import "UIView+Tap.h"
#import <objc/runtime.h>

static NSString *const kTapGesKey = @"ssview_tapges_propkey";
static NSString *const kTapBlockKey = @"ssview_tapblock_propkey";

@implementation UIView (Tap)

- (void)ss_AddTapWithAction:(void(^)(void))block{
    UITapGestureRecognizer *tapGes = objc_getAssociatedObject(self, &kTapGesKey);
    if (!tapGes) {
        tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tapGes];
        objc_setAssociatedObject(self, &kTapGesKey, tapGes, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    objc_setAssociatedObject(self, &kTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    if (tap.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &kTapBlockKey);
        if (action) {
            action();
        }
    }
}

@end
