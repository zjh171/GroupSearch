//
//  QSSHomeViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSHomeViewController.h"
#import "QSSGroupInfoCell.h"

@interface QSSHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation QSSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"群搜搜";
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 60;
    
    self.tableView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(QSSGroupInfoCell.class) bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NSStringFromClass(QSSGroupInfoCell.class)];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(QSSGroupInfoCell.class) forIndexPath:indexPath];

    return cell;
}





-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}



@end
