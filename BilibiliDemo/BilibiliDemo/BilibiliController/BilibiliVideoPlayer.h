//
//  BilibiliVideoPlayer.h
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BilibiliVideoPlayer : NSObject

+ (BilibiliVideoPlayer *)Player;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView;

@end

NS_ASSUME_NONNULL_END
