//
//  UIStoryboard+Helper.h
//  Pynoo
//
//  Created by 陈 颜俊 on 14/10/17.
//  Copyright (c) 2014年 UULIAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Helper)
+ (UIStoryboard *)mainStoryboard;
+ (id)viewControllerFromMainStoryboardWithidentifier:(NSString *)identifier;
+ (id)viewControllerFromStoryboard:(NSString *)storyboard identifier:(NSString *)identifier;
+ (id)initialViewControllerFromStoryboard:(NSString *)storyboard;
@end
