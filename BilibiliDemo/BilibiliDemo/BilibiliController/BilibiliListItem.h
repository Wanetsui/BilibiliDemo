//
//  BilibiliListItem.h
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BilibiliListItem : NSObject<NSSecureCoding>

@property(nonatomic, copy, readwrite) NSString *coverPicUrl;
@property(nonatomic, copy, readwrite) NSString *title;

- (void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
