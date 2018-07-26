//
//  AutoLayoutViewController.m
//  AutoCellHeight
//
//  Created by Goko on 09/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "AutoLayoutViewController.h"
#import "AutolayoutModel.h"

@interface AutoLayoutViewController ()

@property(nonatomic,copy)NSArray <AutolayoutModel *>* autoLayoutModels;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [self autoLayoutModels];
    self.modelArray = [NSMutableArray arrayWithArray:self.autoLayoutModels];
    [super viewDidLoad];
}
-(NSArray<AutolayoutModel *> *)autoLayoutModels{
    if (_autoLayoutModels == nil) {
        NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"autolayout" ofType:@"json"]];
        NSArray * dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil][@"data"];
        //for test
        for (int i=0; i<10; i++) {
            dataArray = [dataArray arrayByAddingObjectsFromArray:dataArray];
        }
        _autoLayoutModels = [NSArray yy_modelArrayWithClass:[AutolayoutModel class] json:dataArray];
    }
    return _autoLayoutModels;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.modelArray[indexPath.row] rowHeight];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
