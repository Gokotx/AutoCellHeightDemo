//
//  BaseViewController.m
//  AutoCellHeight
//
//  Created by Goko on 10/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_configUI];
    // Do any additional setup after loading the view.
}
-(void)p_configUI{
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseCellModel * model = self.modelArray[indexPath.row];
    BaseTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[model reuseIdentifier]];
    if (nil == cell) {
        Class cellClass = [model bindingCellClass];
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[model reuseIdentifier]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseTableViewCell * currentCell = (BaseTableViewCell*)cell;
    [currentCell fillCellWithModel:self.modelArray[indexPath.row]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * reuserIdentifier = [self.modelArray[indexPath.row] reuseIdentifier];
    BaseCellModel * model = self.modelArray[indexPath.row];
    model.indexPath = indexPath;
    model.tableView = tableView;
    if (model.rowHeight>0) {
        return model.rowHeight;
    }
    CGFloat height = [tableView fd_heightForCellWithIdentifier:reuserIdentifier cacheByIndexPath:indexPath configuration:^(id cell) {
        [cell fillCellWithModel:self.modelArray[indexPath.row]];
    }];
    return (int)height;
}
#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - property initial
-(NSMutableArray<BaseCellModel *> *)modelArray{
    if (nil == _modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.view = nil;
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
