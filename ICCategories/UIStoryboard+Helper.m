//
//  UIStoryboard+Helper.m
//
//  Created by 陈 颜俊 on 14/10/17.
//

#import "UIStoryboard+Helper.h"

#define kStoryboard_iPhone  @"Main"

@implementation UIStoryboard (Helper)
+ (UIStoryboard *)mainStoryboard
{
    return [UIStoryboard storyboardWithName:kStoryboard_iPhone bundle:nil];
}

+ (id)viewControllerFromMainStoryboardWithidentifier:(NSString *)identifier
{
    return [[self mainStoryboard] instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromStoryboard:(NSString *)storyboard identifier:(NSString *)identifier
{
    return [[UIStoryboard storyboardWithName:storyboard bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

+ (id)initialViewControllerFromStoryboard:(NSString *)storyboard
{
    return [[UIStoryboard storyboardWithName:storyboard bundle:nil] instantiateInitialViewController];
}
@end
