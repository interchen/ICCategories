//
//  NSAttributedString+Color.h
//  Pynoo
//
//  Created by 陈 颜俊 on 14/10/14.
//  Copyright (c) 2014年 UULIAN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Helper)
+ (NSAttributedString *)attributeStringWithContent:(NSString *)content keyWords:(NSArray *)keyWords color:(UIColor *)color;
@end
