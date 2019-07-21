//
//  QSSUploadPhotoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSUploadPhotoCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "QSSUploadPhotoCellModel.h"

@interface QSSUploadPhotoCell ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *uploadButton;


@property (nonatomic, strong) QSSUploadPhotoCellModel *viewModel;

@end


@implementation QSSUploadPhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.uploadButton.layer.borderWidth = 1.f;
//    self.uploadButton.layer.borderColor =  [UIColor colorWithRed:0/255.0 green:119/255.0 blue:255/255.0 alpha:1.0].CGColor;
    
    CAShapeLayer *border = [CAShapeLayer layer];
    
    //虚线的颜色
    border.strokeColor =  [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0].CGColor;
    //填充的颜色
    border.fillColor = [UIColor clearColor].CGColor;
    
    //设置路径
//    border.path = [UIBezierPath bezierPathWithRect:self.uploadButton.bounds].CGPath;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.uploadButton.bounds cornerRadius:5];

    border.path = path.CGPath;
    
    border.frame = self.uploadButton.bounds;
    //虚线的宽度
    border.lineWidth = 1.f;
    
    
    //设置线条的样式
    //    border.lineCap = @"square";
    //虚线的间隔
    border.lineDashPattern = @[@4, @2];
    
    [self.uploadButton.layer addSublayer:border];
    
    @weakify(self);
    [[self.uploadButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        UIViewController *vc = [self.class jsd_getCurrentViewController];
        /**
         其实和从相册选择一样，只是获取方式不同，前面是通过相册，而现在，我们要通过相机的方式
         */
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [vc presentViewController:PickerImage animated:YES completion:nil];
        
    }];
    
    
    
}

-(void) bindViewModel:(id) viewModel {
    self.viewModel = viewModel;
    
}


#pragma mark--------PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //定义一个newPhoto，用来存放我们选择的图片。
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    self.viewModel.qrCodeImage = newPhoto;
    
    [self.uploadButton setBackgroundImage:newPhoto forState:UIControlStateNormal];
    UIViewController *vc = [self.class jsd_getCurrentViewController];

    [vc dismissViewControllerAnimated:YES completion:nil];
    
}

+ (UIViewController *)jsd_getRootViewController{
    
    UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
    NSAssert(window, @"The window is empty");
    return window.rootViewController;
}


+ (UIViewController *)jsd_getCurrentViewController{
    
    UIViewController* currentViewController = [self jsd_getRootViewController];
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                
                currentViewController = currentViewController.childViewControllers.lastObject;
                
                return currentViewController;
            } else {
                
                return currentViewController;
            }
        }
        
    }
    return currentViewController;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
