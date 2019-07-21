//
//  QSSEditGroupViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSEditGroupViewController.h"
#import "QSSGroupNameInfoCell.h"
#import "QSSGroupContentCell.h"

#import "QSSUploadPhotoCell.h"

@interface QSSEditGroupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation QSSEditGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"添加";
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 60;
    
    UIImage *editImage = [UIImage imageNamed:@"ico_back"];
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:editImage style:UIBarButtonItemStyleDone target:self action:@selector(backButtonClicked)];
    self.navigationItem.leftBarButtonItem = item;
    
    self.tableView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(QSSGroupNameInfoCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(QSSGroupNameInfoCell.class)];
    
    UINib *nib1 = [UINib nibWithNibName:NSStringFromClass(QSSGroupContentCell.class) bundle:nil];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:NSStringFromClass(QSSGroupContentCell.class)];
    
    UINib *nib2 = [UINib nibWithNibName:NSStringFromClass(QSSUploadPhotoCell.class) bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:NSStringFromClass(QSSUploadPhotoCell.class)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableView) name:@"updateTableView" object:nil];
    
    [self.view addSubview:self.tableView];
}

-(void) backButtonClicked {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void) updateTableView {
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *tags = @[NSStringFromClass(QSSGroupNameInfoCell.class),NSStringFromClass(QSSGroupContentCell.class),NSStringFromClass(QSSUploadPhotoCell.class)];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tags[indexPath.row] forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}



@end
