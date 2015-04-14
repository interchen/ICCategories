//
//  UIView+Hierarchy.h
//  SmartPhone
//
//  Created by 陈颜俊 on 14-3-4.
//  Copyright (c) 2014年 Leedason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Helper)
- (id)findSubViewWithSubViewClass:(Class)clazz;
- (id)findsuperViewWithSuperViewClass:(Class)clazz;

- (BOOL)findAndResignFirstResponder;
- (UIView *)findFirstResponder;
@end
