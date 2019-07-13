//
//  QSSEditGroupViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSEditGroupViewController.h"
#import "QSSGroupNameInfoCell.h"

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
    [self.view addSubview:self.tableView];
}

-(void) backButtonClicked {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(QSSGroupNameInfoCell.class) forIndexPath:indexPath];
    
    return cell;
}





-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}



@end
