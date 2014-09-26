//
//  contain.h
//  slideimage
//
//  Created by llch on 14-9-26.
//  Copyright (c) 2014年 llch. All rights reserved.
//

#ifndef slideimage_contain_h
#define slideimage_contain_h

#define CM_ScreenFrame                          [UIScreen mainScreen].bounds
#define CM_iPhone6Factor                        1.15f
#define CM_iPhone6PlusFactor                    1.3f

#endif
@interface UIColor (CreateMethods)
// wrapper for [UIColor colorWithRed:green:blue:alpha:]
// values must be in range 0 - 255
+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;

// Creates color using hex representation
// hex - must be in format: #FF00CC
// alpha - must be in range 0.0 - 1.0
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;

+(UIColor*)tintColorWithColor:(UIColor *)color;
@end


//
//  UIColor+CreateMethods.m
//  CityGuide
//
//  Created by zshowing on 12-4-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//



@implementation UIColor (CreateMethods)

+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:(red/255.0) green:(green/255.0) blue:(blue/255.0) alpha:alpha];
}

+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha {
    
    assert(7 == [hex length]);
    assert('#' == [hex characterAtIndex:0]);
    
    NSString *redHex = [NSString stringWithFormat:@"0x%@", [hex substringWithRange:NSMakeRange(1, 2)]];
    NSString *greenHex = [NSString stringWithFormat:@"0x%@", [hex substringWithRange:NSMakeRange(3, 2)]];
    NSString *blueHex = [NSString stringWithFormat:@"0x%@", [hex substringWithRange:NSMakeRange(5, 2)]];
    
    unsigned redInt = 0;
    NSScanner *rScanner = [NSScanner scannerWithString:redHex];
    [rScanner scanHexInt:&redInt];
    
    unsigned greenInt = 0;
    NSScanner *gScanner = [NSScanner scannerWithString:greenHex];
    [gScanner scanHexInt:&greenInt];
    
    unsigned blueInt = 0;
    NSScanner *bScanner = [NSScanner scannerWithString:blueHex];
    [bScanner scanHexInt:&blueInt];
    
    return [UIColor colorWith8BitRed:redInt green:greenInt blue:blueInt alpha:alpha];
}

+(UIColor *)tintColorWithColor:(UIColor *)color{
    CGColorRef colorRef = color.CGColor;
    const CGFloat *oldComponentColors = CGColorGetComponents(colorRef);
    int numberOfComponents = CGColorGetNumberOfComponents(colorRef);
    CGFloat newComponentColors[numberOfComponents];
    int i = numberOfComponents - 1;
    newComponentColors[i] = oldComponentColors[i]; // alpha
    CGFloat temp;
    while (--i >= 0) {
        CGFloat oldColor = oldComponentColors[i] * 255;
        temp = -0.0016 * powf(oldColor, 2);
        temp += (1.2686 * oldColor + 33.97);
        newComponentColors[i] = temp / 255.0;
    }
    CGColorRef newCGColor = CGColorCreate(CGColorGetColorSpace(colorRef), newComponentColors);
    UIColor *newColor = [UIColor colorWithCGColor:newCGColor];
    CGColorRelease(newCGColor);
    
    return newColor;
}

@end
