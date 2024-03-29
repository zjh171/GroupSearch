//
//  QSSGroupDetailViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupDetailViewController.h"
#import "QSSGroupContentShowCell.h"
#import "QSSGroupQRCodeShowCell.h"
#import "QSSQRCodeDetailViewController.h"

@interface QSSGroupDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) QSSGroupDetailViewModel *viewModel;

@end

@implementation QSSGroupDetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (instancetype)initWithViewModel:(NSObject *)viewModel {
    if (self = [super initWithViewModel:viewModel]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 75;
    [self.view addSubview:self.tableView];
    
    @weakify(self);
    [RACObserve(self, viewModel.title) subscribeNext:^(NSString *x) {
        @strongify(self);
        self.title = x;
        
    }];
    
    
    [RACObserve(self, viewModel.cellModels) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(QSSGroupContentShowCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(QSSGroupContentShowCell.class)];
    
    UINib *nib2 = [UINib nibWithNibName:NSStringFromClass(QSSGroupQRCodeShowCell.class) bundle:nil];
    [self.tableView registerNib:nib2 forCellReuseIdentifier:NSStringFromClass(QSSGroupQRCodeShowCell.class)];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        self.tableView.frame = CGRectMake(0, 44 + 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 44 - 44);
    }
    
    UIImage *editImage = [UIImage imageNamed:@"ico_back"];
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:editImage style:UIBarButtonItemStyleDone target:self action:@selector(backButtonClicked)];
    self.navigationItem.leftBarButtonItem = item;
    
}


-(void) backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *identifys = @[NSStringFromClass(QSSGroupContentShowCell.class),NSStringFromClass(QSSGroupQRCodeShowCell.class)];
    QSSGroupContentShowCell *cell = [tableView dequeueReusableCellWithIdentifier:identifys[indexPath.row] forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.cellModels[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QSSGroupQRCodeShowCellModel *cellModel = self.viewModel.cellModels[indexPath.row];
    QSSQRCodeDetailViewModel *viewModel = [[QSSQRCodeDetailViewModel alloc] initWithParams:@{@"qr":cellModel.pic}];
    QSSQRCodeDetailViewController *vc = [[QSSQRCodeDetailViewController alloc] initWithViewModel:viewModel];
    [self.navigationController pushViewController:vc animated:YES];
    
}




-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return _tableView;
}

@end
