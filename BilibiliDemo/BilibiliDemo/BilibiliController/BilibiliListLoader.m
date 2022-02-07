//
//  BilibiliListLoader.m
//  BilibiliDemo
//
//  Created by 崔婉莹 on 2022/1/20.
//

#import "BilibiliListLoader.h"
#import "BilibiliListItem.h"
#import <AFNetworking.h>

@implementation BilibiliListLoader

-(void)loadListDataWithFinishBlock:(BilibiliListLoaderFinishBlock)finishBlock{
    NSArray<BilibiliListItem *> *listdata = [self _readDataFromLocal];
    if (listdata) {
        finishBlock(YES, listdata);
    }
    
//    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSString *urlString = @"https://app.bilibili.com/x/v2/feed/index?access_key=8d7cec1163db750c997718d0575e4711&actionKey=appkey&ad_extra=099DC624001322857CFFA510E7A9A5D2589DF11A0DF412BDB497485C14F30FB6586ED90124C482E8832303F184008C9985C37AA364DB26EBC8CA1115EB29EF5DCA7ECA31F674F05E42BE5D8182681743347F4622CE3D5169BF2EA1DC852018842ED1F1307658FF2CBD9997C557DDA167C9FCEEB7699EF23A7BB0DE25310A7814A4FB50312EBEF31832B0E3C4A1F8AB8E76C73581668D436FBE4FF7D4B4541B2E2A92C14AC08A79D1E27C0C7674A35D5308ACD90B3C3DB85E3A8722AFBD5DEF8A5279D049C2116A285BFED1391D592E5AA6D0D5262A579912B7A9FD78587EFA6502C9B54A05742CB1C06850B0C7F0925FB8FA29C3E875D7D05A57F2F4C0999AE7DD136D2A9E2AB441DF92516863E8E167B257CC7EE233CA6C5A6628823C367D9C4FC3A16DF53AC1C937565769FB4803605F49C679A4C09E0F3018828E0F0F680EF08C64627EF3F071044F6B09E64C835FAD20B5AFA0D8FE8064F3334729ED02FCA4EE25D98AA73A821DAF2B9695212BF253F307D31E6BA29CE9D786F2D528288CA86D3A602DBEE01EBB52B0D2E9539A97CA7AB5236EC35FE832E663EF0E4A5C69F92973A994F8D473873E3E7CD5561FCEDCF02212C3966434740925D4D91F2E6C9E61ACA1AAD63B4EBF6E04D0486B056EB578768858BA868B497406869EBAFB6D4AE127649E4A83BF04B31DED14E32B6AC38048D1A77F97A106FBF6681281A1EF728CCA9DD37FFBC1F9BC882A2C8680F222D781B45088C26FD12F1DC24241F9BC9BFA936563C55B9F5935C25989204B1D43C4C2E32BBB6B692B1BBE3A0AAA40D768914C051F1811374FA2298C776EECB77B100B4200154031CEB9EE2542B2B8F9145BE864A9C08BF8BC6155AB5EDDD58907BFB6FD2A9D1807DE63614D07ACE6465C35DBCF9D961E1D65AAD449B85444D32DF8974948B322171BF1DC9E9C54F55B3CF3E672FB51543852E09E1903E80C105711871C4F48FC0EE316A0540C114E036DC821041DDF35DCC959C77DE4FF1C5588128EC82B65976A93F1093281E8719508AFE654F4A605F38789882CB20A0FA8E0DE43F545F17D0429C52025ADC7CCF76B286E7E14769C6969DE203DE88BF4DB3EA4D3ED1CA2D219AF2EAA1E59ECF19F525951FF7A8F9F84969CC0FF4CBD92D3093368DE4009C79FE411A3D74F0E31DA74FFEA2E6A6894EABA95229A95EE2EC040BCEA967C63073936920B82D9375EEA1875589604253F2838FD75996CBDC949A9B78A98932F4CDD3460C89DAE24D1AB1C9C22A633F9947A2345007B1BC19C654A19BE3550F6AC7EB683961A4DFF1CC12E881DEAC2EEB370ACE20844D940DEF1489CBA7CE407F79BE532EDBCF44A85838CCD06F15521CF3A5AFD3C75A0B0B43D6BBFD534BE5BCFE54CD6ADF87B32F5CFD4C8DF3C2DE1AC1F03478588970ECF71&appkey=27eb53fc9058f8c3&autoplay_card=11&autoplay_timestamp=0&banner_hash=5297997494266767999&build=65700100&c_locale=zh-Hans_CN&column=2&column_timestamp=0&device=phone&device_name=iPhone%208&disable_rcmd=0&flush=6&fnval=464&fnver=0&force_host=0&fourk=1&guidance=0&https_url_req=0&idx=1642136558&inline_danmu=2&inline_sound=1&mobi_app=iphone&network=wifi&open_event=&platform=ios&player_net=1&pull=1&qn=32&recsys_mode=0&s_locale=zh-Hans_AL&sign=2c101ff4bd003500e9ae7268ead06cb9&splash_id=&statistics=%7B%22appId%22%3A1%2C%22version%22%3A%226.57.0%22%2C%22abtest%22%3A%22%22%2C%22platform%22%3A1%7D&ts=1642585124&voice_balance=0";
    NSURL *listURL = [NSURL URLWithString:urlString];

    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;

    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        //url失效了先做视频吧
#warning 类型的检查
        NSArray *dataArray = [((NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"data"]) objectForKey:@"items"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for(NSDictionary *info in dataArray){
            BilibiliListItem *listItem = [[BilibiliListItem alloc] init];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        
        [weakSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(error == nil, listItemArray.copy);
            }
        });
//        NSLog(@"");
    }];

    [dataTask resume];
}

- (NSArray<BilibiliListItem *> *)_readDataFromLocal{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *listDataPath = [cachePath stringByAppendingPathComponent:@"GTData/BilibiliList"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];

    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[BilibiliListItem class], nil]  fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<BilibiliListItem *> *)unarchiveObj;
    }
    return nil;;
}

- (void)_archiveListDataWithArray:(NSArray<BilibiliListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"BilibiliData"];
    NSError *creatError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&creatError];
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"BilibiliList"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
}

@end
