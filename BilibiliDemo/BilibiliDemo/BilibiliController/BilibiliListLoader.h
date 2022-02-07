//
//  BilibiliListLoader.h
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/20.
//

#import <Foundation/Foundation.h>

@class BilibiliListItem;

NS_ASSUME_NONNULL_BEGIN

typedef void(^BilibiliListLoaderFinishBlock)(BOOL success, NSArray<BilibiliListItem *> *dataArray);

@interface BilibiliListLoader : NSObject

-(void)loadListDataWithFinishBlock:(BilibiliListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
