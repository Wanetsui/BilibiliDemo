//
//  BilibiliVideoCoverView.m
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/19.
//

#import "BilibiliVideoCoverView.h"
#import "BilibiliVideoPlayer.h"
#import "AVFoundation/AVFoundation.h"
#import "BilibiliVideoToolbar.h"
#import "BilibiliScreen.h"

@interface BilibiliVideoCoverView ()
@property (nonatomic, strong, readwrite) UIImageView *coverView;
@property (nonatomic, strong, readwrite) UIImageView *playButton;
@property (nonatomic, copy, readwrite) NSString *videoUrl;
@property (nonatomic, strong, readwrite) BilibiliVideoToolbar *toolbar;
@end

@implementation BilibiliVideoCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        [self addSubview:({
//            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - BilibiliVideoToolbarHeight)];
            _coverView;
        })];

        [_coverView addSubview:({
//            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake( (frame.size.width - 50) / 2, (frame.size.height - 50) / 2, 50, 50)];
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - UI(50)) / 2, (frame.size.height - BilibiliVideoToolbarHeight - UI(50)) / 2, UI(50), UI(50))];
            _playButton.image = [UIImage imageNamed:@"videoPlay"];
            _playButton;
        })];

        [self addSubview:({
            _toolbar = [[BilibiliVideoToolbar alloc] initWithFrame:CGRectMake(0, _coverView.bounds.size.height, frame.size.width, BilibiliVideoToolbarHeight)];
            _toolbar;
        })];

        //点击全部Item都支持播放
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)dealloc {
}

#pragma mark - public method

- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _videoUrl = videoUrl;
    [_toolbar layoutWithModel:nil];
}

#pragma mark - private method

- (void)_tapToPlay {
    //在当前Item上播放视频
    [[BilibiliVideoPlayer Player] playVideoWithUrl:_videoUrl attachView:_coverView];
//    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
//
//    AVAsset *asset = [AVAsset assetWithURL:videoURL];
//
//    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
//
//    AVPlayer *avPlayer= [AVPlayer playerWithPlayerItem:videoItem];
//
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
//
//    playerLayer.frame = _coverView.bounds;
//    [_coverView.layer addSublayer:playerLayer];
//    [avPlayer play];
}

@end
