//
//  BilibiliListItem.m
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/20.
//

#import "BilibiliListItem.h"

@implementation BilibiliListItem

#pragma mark - NSSecureCoding
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super self];
    if(self){
        self.coverPicUrl = [aDecoder decodeObjectForKey:@"cover"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.coverPicUrl forKey:@"cover"];
    [aCoder encodeObject:self.title forKey:@"title"];
}

+ (BOOL)supportsSecureCoding{
    return YES;
}

#pragma mark - public method
- (void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型是否匹配
    self.coverPicUrl = [dictionary objectForKey:@"cover"];
    self.title = [dictionary objectForKey:@"title"];
}

@end
