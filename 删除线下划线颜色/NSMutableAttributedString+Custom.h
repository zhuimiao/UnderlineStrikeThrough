//
//  NSMutableString+Custom.h
//  图文混排
//
//  Created by 妙弋pc on 15/7/20.
//  Copyright (c) 2015年 妙弋pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (Custom)
/**
 *  添加颜色
 */
- (void)addColor:(UIColor *)color substring:(NSString *)substring;
/**
 *  添加背景颜色
 */
- (void)addBackgroundColor:(UIColor *)color substring:(NSString *)substring;
/**
 *  添加下划线
 */
- (void)addUnderlineForSubstring:(NSString *)substring;

/**
 *  下划线的颜色
 *
 */
- (void)addUnderlineColor:(UIColor *)color;

/**
 *  添加删除线
 *  thickness 删除线的类型，1,NSUnderlineStyleSingle ， 2,NSUnderlineStyleThick, 3,NSUnderlineStyleThick
 */

- (void)addStrikeThrough:(int)thickness substring:(NSString *)substring;

/**
 *  删除线的颜色
 *
 */
- (void)addStrikethroughColor:(UIColor *)color;
/**
 *  设置阴影
 *  单独设置不好使，必须和其他属性搭配才好使。
 *  和这三个任一个都好使，NSVerticalGlyphFormAttributeName，NSObliquenessAttributeName，NSExpansionAttributeName
 *
 *  @param color     颜色
 *  @param width     宽度
 *  @param height    高度
 *  @param radius    圆角
 *  @param substring 子串
 */
- (void)addShadowColor:(UIColor *)color width:(int)width height:(int)height radius:(int)radius substring:(NSString *)substring;
/**
 *  设置字体格式和大小
 *
 *  @param fontName  字体名称：宋体
 *  @param fontSize  字体大小
 *  @param substring 子串
 */
- (void)addFontWithName:(NSString *)fontName size:(int)fontSize substring:(NSString *)substring;
/**
 *  设置字体
 */
- (void)addFont:(UIFont *)font substring:(NSString *)substring;
/**
 *  设置段落样式
 *
 *  @param alignment 段落样式：行间距
 *  @param substring 子串
 */
- (void)addLineMargin:(CGFloat)lineMargin substring:(NSString *)substring;

/**
 *  设置文字描边颜色和描边宽度，使文字空心
 *
 *  @param color     描边颜色
 *  @param thickness 描边宽度
 *  @param substring 子串
 */
- (void)addStrokeColor:(UIColor *)color thickness:(int)thickness substring:(NSString *)substring;

/**
 *  添加图片
 *
 *  @param imgName 图片名称
 *  @param frame   图片的frame
 */
- (void)addImageWithImageName:(NSString *)imgName frame:(CGRect)frame;

/**
 *  添加图片
 *
 *  @param imgName 图片的名字
 *  图片的宽度如果比屏幕大，就把图片宽度设置成屏幕宽度，图片的高度相应改变
 */
- (void)addImageWithImagename:(NSString *)imgName;

/**
 *  添加一张图片
 *
 *  @param image 图片
 */
- (void)addImage:(UIImage *)image;
/**
 *  添加字符串
 *
 *  @param str 普通字符串
 */
- (void)addString:(NSString *)str;




@end
