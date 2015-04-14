//
//  UITableViewCell+Helper.m
//
//  Created by 陈 颜俊 on 15/3/25.
//

#import "UITableViewCell+Helper.h"

@implementation UITableViewCell (Helper)
- (void)setEdgeInset:(UIEdgeInsets)edgeInset
{
    // Remove seperator inset
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:edgeInset];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([self respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [self setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:edgeInset];
    }
}
@end
