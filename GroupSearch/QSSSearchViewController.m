//
//  QSSSearchViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/17.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSSearchViewController.h"

#import "QSSGroupInfoCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "QSSGroupDetailViewController.h"

@interface QSSSearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) QSSSearchViewModel *viewModel;

@end

@implementation QSSSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"搜索";
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 75;
    
    [self.view addSubview:self.tableView];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(QSSGroupInfoCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(QSSGroupInfoCell.class)];
    
    [self.view addSubview:self.searchBar];

    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        
        self.searchBar.frame =  CGRectMake(0,  44, UIScreen.mainScreen.bounds.size.width, 40);

        self.tableView.frame = CGRectMake(0, 44 +  40, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - 40 - 44 - 44);
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
    
    self.searchBar.delegate = self;
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self.viewModel.requestGroupCommand execute:searchText];
}


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillDisappear:animated];
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



-(UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"搜索";
        _searchBar.tintColor = UIColor.whiteColor;
        _searchBar.barTintColor = UIColor.whiteColor;
        
    }
    return _searchBar;
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

@end
