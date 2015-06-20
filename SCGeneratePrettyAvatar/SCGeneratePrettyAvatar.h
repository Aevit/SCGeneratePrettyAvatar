//
//  SCGeneratePrettyAvatar.h
//  SCGeneratePrettyAvatarDemo
//
//  Created by Aevit on 15/6/20.
//  Copyright (c) 2015年 Aevit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SCGeneratePrettyAvatar : NSObject

/**
 *  generate a pretty avatar image
 *
 *  if the first two character includes Chinese, the the text on the image is the first Chinese character,
 *  then the text on the image is the first two English character.
 *
 *  @param text   the text show on the image
 *  @param length the length of the image
 *
 *  @return image
 */
+ (UIImage*)generateWithText:(NSString*)text imageLength:(CGFloat)length;

@end
