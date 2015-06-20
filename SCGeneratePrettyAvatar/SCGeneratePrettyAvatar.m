//
//  SCGeneratePrettyAvatar.m
//  SCGeneratePrettyAvatarDemo
//
//  Created by Aevit on 15/6/20.
//  Copyright (c) 2015年 Aevit. All rights reserved.
//

#import "SCGeneratePrettyAvatar.h"

@implementation SCGeneratePrettyAvatar

/**
 *  generate a pretty avatar image
 *
 *  if the first two character includes Chinese, then the text on the image is the first Chinese character,
 *  else the text on the image is the first two English character.
 *
 *  @param text   the text show on the image
 *  @param length the length of the image
 *
 *  @return image
 */
+ (UIImage*)generateWithText:(NSString*)text imageLength:(CGFloat)length {
    NSArray *colorArr = @[@"0x1abc9c", @"0x2ecc71", @"0x3498db", @"0x9b59b6", @"0x34495e", @"0xf1c40f", @"0xe67e22", @"0xe74c3c"];
    
    // get a random color
    unsigned long hexColor = strtoul([colorArr[arc4random() % 7] UTF8String], 0, 16);
    UIColor *color = [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1];
    
    // substring
    NSString *finalStr = (text.length <= 0 ? @"" : [text substringToIndex:1]);
    if (text.length > 1) {
        for (int i = 0; i < text.length; i++) {
            unichar ch = [text characterAtIndex:i];
            if (0x4e00 < ch  && ch < 0x9fff) {
                // is chinese
                if (i == 0) {
                    break;
                } else if (i == 1) {
                    finalStr = [text substringWithRange:NSMakeRange(1, 1)];
                    break;
                }
            } else {
                if (i == 1) {
                    finalStr = [text substringWithRange:NSMakeRange(0, 2)];
                    break;
                }
            }
        }
    }
    
    // generate image
    return [SCGeneratePrettyAvatar createImageWithColor:color text:finalStr imageLength:length];
}

/**
 *  generate a image
 *
 *  @param color  backgroundcolor
 *  @param text   the text on the image
 *  @param length the size of the image (width equals to height)
 *
 *  @return final image
 */
+ (UIImage*)createImageWithColor:(UIColor*)color text:(NSString*)text imageLength:(CGFloat)length {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, length, length);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    // calculate the size of text
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:length / 2.00], NSForegroundColorAttributeName:[UIColor whiteColor]};
    CGSize textSize = [text boundingRectWithSize:rect.size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    [text drawAtPoint:CGPointMake((rect.size.width - textSize.width) / 2, (rect.size.height - textSize.height) / 2) withAttributes:attributes];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
