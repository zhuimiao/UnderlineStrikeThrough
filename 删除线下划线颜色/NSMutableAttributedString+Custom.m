//
//  NSMutableString+Custom.m
//  图文混排
//
//  Created by 妙弋pc on 15/7/20.
//  Copyright (c) 2015年 妙弋pc. All rights reserved.
//

#import "NSMutableAttributedString+Custom.h"

@interface NSString(MASAttributes)
-(NSRange)rangeOfStringNoCase:(NSString*)s;
@end

@implementation NSString(MASAttributes)

/**
 *  不区分大小写，查找子串在大串中的range（起始位置，和宽度）
 *
 *  @param s 子串
 *
 *  @return 子串在大串中的range
 */
-(NSRange)rangeOfStringNoCase:(NSString*)s
{
    return  [self rangeOfString:s options:NSCaseInsensitiveSearch];
}

@end

@implementation NSMutableAttributedString (Custom)

- (void)addColor:(UIColor *)color substring:(NSString *)substring{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSForegroundColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addBackgroundColor:(UIColor *)color substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSBackgroundColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addUnderlineForSubstring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute: NSUnderlineStyleAttributeName
                     value:@(NSUnderlineStyleSingle)
                     range:range];
    }
}
- (void)addUnderlineColor:(UIColor *)color;
{
    NSRange range = NSMakeRange(0, self.length);
    if (range.location != NSNotFound) {
        [self addAttribute: NSUnderlineColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addStrikeThrough:(int)thickness substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        [self addAttribute: NSStrikethroughStyleAttributeName
                     value:@(thickness)
                     range:range];
    }
}

- (void)addStrikethroughColor:(UIColor *)color
{
    NSRange range = NSMakeRange(0, self.length);
    if (range.location != NSNotFound) {
        [self addAttribute: NSStrikethroughColorAttributeName
                     value:color
                     range:range];
    }
}
- (void)addShadowColor:(UIColor *)color width:(int)width height:(int)height radius:(int)radius substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        NSShadow *shadow = [[NSShadow alloc] init];
        [shadow setShadowColor:color];
        [shadow setShadowOffset:CGSizeMake (width, height)];
        [shadow setShadowBlurRadius:radius];
        
        [self addAttribute: NSShadowAttributeName
                     value:shadow
                     range:range];
    }
}
- (void)addFontWithName:(NSString *)fontName size:(int)fontSize substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && fontName != nil) {
        UIFont * font = [UIFont fontWithName:fontName size:fontSize];
        [self addAttribute: NSFontAttributeName
                     value:font
                     range:range];
    }
}


- (void)addFont:(UIFont *)font substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && font != nil) {
        [self addAttribute: NSFontAttributeName
                     value:font
                     range:range];
    }
}
- (void)addLineMargin:(CGFloat)lineMargin substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound) {
        NSMutableParagraphStyle* style=[[NSMutableParagraphStyle alloc]init];
        style.lineSpacing = lineMargin;
        [self addAttribute: NSParagraphStyleAttributeName
                     value:style
                     range:range];
    }
}

- (void)addStrokeColor:(UIColor *)color thickness:(int)thickness substring:(NSString *)substring
{
    NSRange range = [self.string rangeOfStringNoCase:substring];
    if (range.location != NSNotFound && color != nil) {
        [self addAttribute:NSStrokeColorAttributeName
                     value:color
                     range:range];
        [self addAttribute:NSStrokeWidthAttributeName
                     value:@(thickness)
                     range:range];
    }
}

- (void)addImageWithImageName:(NSString *)imgName frame:(CGRect)frame
{
    //添加图片
    NSTextAttachment *attach = [[NSTextAttachment alloc]init];
    attach.image = [UIImage imageNamed:imgName];
    //可以根据字体的大小设置图片的大小，width和height为字体的size
    attach.bounds = frame;
    //将图片转为NSAttributedString
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    //将NSAttributedString拼接在string后
    //[注意：NSMutableAttributedString 只能拼接NSMutableAttributedString、NSAttributedString]
    [self appendAttributedString:attachString];
}

- (void)addImageWithImagename:(NSString *)imgName
{
    NSTextAttachment *attach = [[NSTextAttachment alloc]init];
    attach.image = [UIImage imageNamed:imgName];
    CGSize size = attach.image.size;
    CGFloat screenW =  [UIScreen mainScreen].bounds.size.width;
    if (size.width > screenW) {
        size.height = size.height*(screenW/size.width);
        size.width = screenW;
    }
    attach.bounds = CGRectMake(0, 0, size.width, size.height);
        NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    [self appendAttributedString:attachString];

}

- (void)addImage:(UIImage *)image
{
    NSTextAttachment *attach = [[NSTextAttachment alloc]init];
    attach.image = image;
    CGSize size = attach.image.size;
    CGFloat screenW =  [UIScreen mainScreen].bounds.size.width;
    CGFloat width = screenW - 2 * 13;
    if (size.width > width) {
        size.height = size.height*(width/size.width);
        size.width = width;
    }
    attach.bounds = CGRectMake(0, 0, size.width, size.height);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    [self addString:@"\r\n"];
    [self appendAttributedString:attachString];

}

- (void)addString:(NSString *)str;
{
    NSAttributedString *muatt = [[NSAttributedString alloc]initWithString:str];
    [self appendAttributedString:muatt];
}




@end
