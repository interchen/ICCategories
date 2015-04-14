//
//  NSAttributedString+Color.m
//
//  Created by 陈 颜俊 on 14/10/14.
//

#import "NSAttributedString+Helper.h"

@implementation NSAttributedString (Helper)
+ (NSAttributedString *)attributeStringWithContent:(NSString *)content keyWords:(NSArray *)keyWords color:(UIColor *)color {
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:content];
    if (keyWords) {
        [keyWords enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSRange range = [content rangeOfString:obj];
            NSInteger location = 0;
            while (range.length > 0) {
                [attString addAttribute:(NSString*)NSForegroundColorAttributeName
                                  value:color
                                  range:NSMakeRange(location + range.location, range.length)];
                location += (range.location+range.length);
                NSString *tmp = [content substringWithRange:NSMakeRange(range.location + range.length, content.length - location)];
                range = [tmp rangeOfString:obj];
            }
        }];
    }
    return attString;
}
@end
