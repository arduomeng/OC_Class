//
//  CSUtil.m
//  ShareExtension
//
//  Created by user on 2017/5/3.
//  Copyright © 2017年 user. All rights reserved.
//

#import "CSUtil.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CSUtil


#pragma mark 正则表达式
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:email];
}

+ (BOOL)isValidateMobile:(NSString *)mobile
{
    NSString *regex = @"^((13[0-9])|(14[5,7])|(15[^4,\\D])|(18[0,0-9])|(17[0,5-8]))\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:mobile];
}

+ (BOOL)checkPassword:(NSString *) password
{
    // 正则匹配用户密码6-18位数字和字母组合
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
    
}
+ (BOOL) validateCarNo:(NSString *)carNo
{
    //    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    //    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //    MyLog(@"carTest is %@",carTest);
    //    MyLog(@"%@",carNo);
    //    return [carTest evaluateWithObject:carNo];
    
    
    //  NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z0-9]{5}+$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    //    MyLog(@"carTest is %@",carTest);
    //    MyLog(@"%@",carNo);
    return [carTest evaluateWithObject:carNo];
    //  return YES;
}
+ (BOOL)isStringEmpty:(NSString *)str
{
    if (str && str.length > 0) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        return (str.length <= 0);
    }
    return YES;
}

+ (NSString *)trimStringEmpty:(NSString *)str
{
    if (str && str.length > 0) {
        return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"        ";
}
+ (NSString *)trimStringNil:(NSString *)str
{
    if (str && str.length > 0) {
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (str.length > 0) {
            return str;
        }
    }
    return nil;
}


#pragma mark MD5
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)md5OfFilePath:(NSString *)filePath
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (!handle) {
        return @"";
    }
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 256 ];
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString *s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    
    return s;
}

#pragma mark 文件操作
+(NSString*)documentsDirectory
{
    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath=[documents objectAtIndex:0];
    return documentPath;
}
+(NSString*)cachesDirectory
{
    NSArray *caches= NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesPath=[caches objectAtIndex:0];
    return cachesPath;
}
+(NSString*)documentDirectory
{
    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath=[documents objectAtIndex:0];
    return documentPath;
}

+(NSString*)createDirectoryIfNotExists:(NSString *)draftPath
{
    if(![self fileExists:draftPath]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL ret = [fileManager createDirectoryAtPath:draftPath withIntermediateDirectories:YES attributes:nil error:nil];
        if(!ret){
            draftPath = nil;
        }
    }
    return draftPath;
}

+(NSString*)createFileIfNotExists:(NSString *)path
{
    if(![self fileExists:path]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL ret = [fileManager createFileAtPath:path contents:nil attributes:nil];
        if(!ret){
            path = nil;
        }
    }
    return path;
}

+(BOOL)fileExists:(NSString*)file
{
    BOOL exists = NO;
    if(file && [file isKindOfClass:[NSString class]] && ![file isEqualToString:@""]){
        NSFileManager *fileManager = [NSFileManager defaultManager];
        exists = [fileManager fileExistsAtPath:file];
    }
    return exists;
}

// 指定路径
+(NSString*)shareExtensionDir
{
    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath=[documents objectAtIndex:0];
    NSString *shareExtension = [documentPath stringByAppendingPathComponent:@"ShareExtension"];
    
    [self createDirectoryIfNotExists:shareExtension];
    
    return shareExtension;
}

#pragma mark 图像操作
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    //  用一个固定大小的size
    UIGraphicsBeginImageContext(size);
    //    把图片按比例放在这里面
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    //    再取得当前图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (NSString *)getUniqueFileName{
    long long time = [[NSDate date] timeIntervalSince1970] * 1000;
    return [[NSString alloc ]initWithFormat:@"%lld",time];
}

@end
