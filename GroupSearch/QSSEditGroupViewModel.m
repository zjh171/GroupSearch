//
//  QSSEditGroupViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSEditGroupViewModel.h"
#import <QiniuSDK.h>
#import <MJExtension/MJExtension.h>
#import "GTMBase64.h"
#import "CommonCrypto/CommonHMAC.h"
#import <AFNetworking/AFNetworking.h>
#import "QSSGroupInfoModel.h"

@interface QSSEditGroupViewModel ()

@property (nonatomic , assign) int expires;

@end

@implementation QSSEditGroupViewModel

-(void)initilize {
    self.expires = 1800;
}


- (NSString *)makeToken:(NSString *)accessKey secretKey:(NSString *)secretKey bucket:(NSString *)bucket key:(NSString *)key
{
    const char *secretKeyStr = [secretKey UTF8String];
    
    NSString *policy = [self marshal: bucket key:key];
    
    NSData *policyData = [policy dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *encodedPolicy = [GTMBase64 stringByWebSafeEncodingData:policyData padded:TRUE];
    const char *encodedPolicyStr = [encodedPolicy cStringUsingEncoding:NSUTF8StringEncoding];
    
    char digestStr[CC_SHA1_DIGEST_LENGTH];
    bzero(digestStr, 0);
    
    CCHmac(kCCHmacAlgSHA1, secretKeyStr, strlen(secretKeyStr), encodedPolicyStr, strlen(encodedPolicyStr), digestStr);
    
    NSString *encodedDigest = [GTMBase64 stringByWebSafeEncodingBytes:digestStr length:CC_SHA1_DIGEST_LENGTH padded:TRUE];
    
    NSString *token = [NSString stringWithFormat:@"%@:%@:%@",  accessKey, encodedDigest, encodedPolicy];
    
    return token;//得到了token
}

- (NSString *)marshal:(NSString *)bucket key:(NSString *)key
{
    time_t deadline;
    time(&deadline);//返回当前系统时间
    //@property (nonatomic , assign) int expires; 怎么定义随你...
    deadline += (_expires > 0) ? _expires : 3600; // +3600秒,即默认token保存1小时.
    
    NSNumber *deadlineNumber = [NSNumber numberWithLongLong:deadline];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //images是我开辟的公共空间名（即bucket），aaa是文件的key，
    //按七牛“上传策略”的描述：    <bucket>:<key>，表示只允许用户上传指定key的文件。在这种格式下文件默认允许“修改”，若已存在同名资源则会被覆盖。如果只希望上传指定key的文件，并且不允许修改，那么可以将下面的 insertOnly 属性值设为 1。
    //所以如果参数只传users的话，下次上传key还是aaa的文件会提示存在同名文件，不能上传。
    //传images:aaa的话，可以覆盖更新，但实测延迟较长，我上传同名新文件上去，下载下来的还是老文件。
    NSString *value = [NSString stringWithFormat:@"%@:%@", bucket, key];
    [dic setObject:value forKey:@"scope"];//根据
    
    [dic setObject:deadlineNumber forKey:@"deadline"];
    
    NSString *json = [dic mj_JSONString];
    
    return json;
}

+(NSString *)getNowTimeTimestamp3{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
}

-(RACSignal *) submitSignal:(NSString *) picURL {
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        NSDictionary *params = @{@"name":self.groupNameInfoCellModel.groupName,
                                 @"describes":self.groupContentCellModel.groupContent,
                                 @"picUrl":picURL,
                                 };
        NSString *json = [params mj_JSONString];
        
        AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
        [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        manager.requestSerializer = serializer;
        
        // 设置请求格式
        [manager POST:@"http://111.231.67.200:8088/groupSearchPlatform/groupInfo" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            if([responseObject isKindOfClass:NSDictionary.class]) {
                NSDictionary *data = responseObject[@"data"];
                
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
        RACDisposable *dispose = [RACDisposable disposableWithBlock:^{
            
        }];
        return dispose;
    }];
    return signal;
}


-(RACCommand *)submitCommand {
    if (!_submitCommand) {
        _submitCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *input) {
            return [self submitSignal:input];
        }];
    }
    return _submitCommand;
}

-(QSSGroupSubmitViewModel *)submitViewModel {
    if (!_submitViewModel) {
        _submitViewModel = [[QSSGroupSubmitViewModel alloc] init];
        @weakify(self);
        [_submitViewModel.submitButtonClickedSubject subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            
            if (self.groupNameInfoCellModel.groupName.length < 1) {
                [self.errorSubject sendNext:@"请输入群组名"];
                return;
            }
            
            if (self.groupContentCellModel.groupContent.length < 1) {
                [self.errorSubject sendNext:@"请输入群简介"];
                return;
            }
#ifdef DEBUG
            NSString * imageName1 = @"1563703320000.jpg";
            NSString *imageUrl = [NSString stringWithFormat:@"http://image.kyson.cn/%@",imageName1];
            [self.submitCommand execute:imageUrl];
            return;
#endif
            
            if (self.photoCellModel.qrCodeImage == nil) {
                [self.errorSubject sendNext:@"请上传图片"];
                self.submitViewModel.showErrorMsg = YES;
                return;
            }
            
            NSString *imageName = [NSString stringWithFormat:@"%@.jpg",self.class.getNowTimeTimestamp3];
            NSString *token = [self makeToken:@"CMsLaDlP4kcWfAsKhWM3VVS4V3R941xVB5ElRTZ2" secretKey:@"J0dnsNfDEt1YE33BSfJ5iIoifK7xCbYBiNQ9A4x_" bucket:@"kysontupian" key:imageName];
            QNUploadManager *upManager = [[QNUploadManager alloc] init];
            NSData *imageData = UIImagePNGRepresentation(self.photoCellModel.qrCodeImage);
            
            [upManager putData:imageData key:imageName token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
                @strongify(self);

                NSString *imageUrl = [NSString stringWithFormat:@"http://image.kyson.cn/%@",imageName];
                [self.submitCommand execute:imageUrl];
            } option:nil] ;
            
        }];
    }
    
    return _submitViewModel;
}


-(QSSUploadPhotoCellModel *)photoCellModel {
    if (!_photoCellModel) {
        _photoCellModel = [[QSSUploadPhotoCellModel alloc] init];
    }
    return _photoCellModel;
}




-(QSSGroupNameInfoCellModel *)groupNameInfoCellModel {
    if (!_groupNameInfoCellModel) {
        _groupNameInfoCellModel = [[QSSGroupNameInfoCellModel alloc] init];
    }
    return _groupNameInfoCellModel;
}

- (QSSGroupContentCellModel *)groupContentCellModel {
    if (!_groupContentCellModel) {
        _groupContentCellModel = [[QSSGroupContentCellModel alloc] init];
    }
    return _groupContentCellModel;
}


@end
