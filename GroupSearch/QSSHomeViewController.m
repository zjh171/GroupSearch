//
//  QSSHomeViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSHomeViewController.h"
#import "QSSGroupInfoCell.h"
#import "QSSEditGroupViewController.h"
#import "QSSHomeViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "QSSGroupDetailViewController.h"

@interface QSSHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) QSSHomeViewModel *viewModel;

@end

@implementation QSSHomeViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 75;
    
    UIImage *editImage = [UIImage imageNamed:@"ico_add"];
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:editImage style:UIBarButtonItemStyleDone target:self action:@selector(addButtonClicked)];
    self.navigationItem.rightBarButtonItem = item;
    
    [self.view addSubview:self.searchBar];
    
    [self.view addSubview:self.tableView];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(QSSGroupInfoCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(QSSGroupInfoCell.class)];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        self.searchBar.frame =  CGRectMake(0, 44 + 44, UIScreen.mainScreen.bounds.size.width, 40);
        self.tableView.frame = CGRectMake(0, 44 + 44 + 40, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 40 - 44 - 44);
    }
    else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    for(UIView *view in [[[self.searchBar subviews] lastObject] subviews] )
    {
        if([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            view.backgroundColor = [UIColor whiteColor];
        }
    }
    
    @weakify(self);
    [[RACObserve(self, viewModel.cellModels) ignore:nil] subscribeNext:^(NSArray *x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    
}

-(void) addButtonClicked {
    QSSEditGroupViewController *vc = [[QSSEditGroupViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navc animated:YES completion:^{
        
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QSSGroupInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(QSSGroupInfoCell.class) forIndexPath:indexPath];
    [cell bindViewModel:self.viewModel.cellModels[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QSSGroupInfoCellModel *cellModel = self.viewModel.cellModels[indexPath.row];
    NSDictionary *params = @{@"group":cellModel.groupInfo};
    QSSGroupDetailViewModel *viewModel = [[QSSGroupDetailViewModel alloc] initWithParams:params];
    
    QSSGroupDetailViewController *vc = [[QSSGroupDetailViewController alloc] initWithViewModel:viewModel];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}


-(QSSHomeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[QSSHomeViewModel alloc]init];
    }
    return _viewModel ;
}


-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"搜索";
        _searchBar.tintColor = UIColor.whiteColor;
        _searchBar.barTintColor = UIColor.whiteColor;
        
    }
    return _searchBar;
}


@end
