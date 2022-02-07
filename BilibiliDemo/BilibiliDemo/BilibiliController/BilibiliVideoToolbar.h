//
//  BilibiliVideoToolbar.h
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/19.
//

#import <UIKit/UIKit.h>
#import "BilibiliScreen.h"

NS_ASSUME_NONNULL_BEGIN

#define BilibiliVideoToolbarHeight UI(60)

@interface BilibiliVideoToolbar : UIView

- (void)layoutWithModel:(id)model;

@end

NS_ASSUME_NONNULL_END
