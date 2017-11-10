//
//  CSUtil.h
//  ShareExtension
//
//  Created by user on 2017/5/3.
//  Copyright © 2017年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSUtil : NSObject

#pragma mark 正则表达式

+ (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)isValidateMobile:(NSString *)mobile;
+ (BOOL)isStringEmpty:(NSString *)str;
+ (BOOL)checkPassword:(NSString *) password;
+ (BOOL) validateCarNo:(NSString *)carNo;

+ (NSString *)trimStringEmpty:(NSString *)str;
+ (NSString *)trimStringNil:(NSString *)str;


#pragma mark MD5
+ (NSString *)md5:(NSString *)str;
+ (NSString *)md5OfFilePath:(NSString *)filePath;


#pragma mark 沙盒目录
+(NSString*)documentsDirectory;
+(NSString*)cachesDirectory;
+(NSString*)documentDirectory;
+(NSString*)createDirectoryIfNotExists:(NSString *)draftPath;
+(NSString*)createFileIfNotExists:(NSString *)path;
+(BOOL)fileExists:(NSString*)file;

#pragma mark 图像操作
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;


#pragma mark 字体


#pragma mark 其它
+ (NSString *)getUniqueFileName;
@end
