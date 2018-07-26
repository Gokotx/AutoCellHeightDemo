//
//  ViewController.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "ViewController.h"
#import "TextCellModel.h"
#import "ImageCellModel.h"
#import "TextCell.h"
#import "ImageCell.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [self p_addString];
    [self p_addImagePath];
    [self p_randomModelArray];
    [super viewDidLoad];
}
#pragma mark - tableViewDelegate & tableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Log(indexPath, nil);
}

-(void)p_addString{
    NSString * testString = @"上面的代码指定了一个所有 cell 都是 88 高度的 UITableView，对于定高需求的表格，强烈建议使用这种（而非下面的）方式保证不必要的高度计算和调用。rowHeight属性的默认值是 44，所以一个空的 UITableView 显示成那个样子。另一种方式就是实现 UITableViewDelegate 中的后，rowHeight 的设置将无效。所以，这个方法适用于具有多种 cell 高度的 UITableView。estimatedRowHeigh这个属性 iOS7 就出现了， 文档是这么描述它的作用的：If the table contains variable height rows, it might be expensive to calculate all theiheights when the table loads. Using estimation allows you to defer some of the cost of geometry calculation from load time to scrolling time.恩，听上去蛮靠谱的。我们知道，UITableView 是个 UIScrollView，就像平时使用 UIScrollView 一样，加载时指定 contentSize 后它才能根据自己的 bounds、contentInset、contentOffset 等属性共同决定是否可以滑动以及滚动条的长度。而 UITableView 在一开始并不知道自己会被填充多少内容，于是询问 data source 个数和创建 cell，同时询问 delegate 这些 cell 应该显示的高度，这就造成它在加载的时候浪费了多余的计算在屏幕外边的 cell 上。和上面的 rowHeight 很类似，设置这个估算高度有两种方法";
    for (int i = 0; i<150; i++) {
        TextCellModel * model = [TextCellModel new];
        model.title = [testString substringWithRange:NSMakeRange(arc4random()%100, i)];
        [self.modelArray addObject:model];
    }
}
-(void)p_addImagePath{
    NSArray <NSString *>* imagePath = @[@"http://pic9.nipic.com/20100820/2531170_182750402288_2.jpg",
                                        @"http://img.taopic.com/uploads/allimg/121215/267862-12121520062755.jpg",
                                        @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=64d5603d454a20a425133484f83bf257/472309f79052982255cd01ecddca7bcb0a46d426.jpg",
                                        @"http://pic38.nipic.com/20140306/6608733_170548491000_2.jpg",
                                        @"http://img01.taopic.com/160909/318760-160Z91Z63372.jpg"];
    for (int i = 0; i<4; i++) {
        imagePath = [imagePath arrayByAddingObjectsFromArray:imagePath];
    }
    [imagePath enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ImageCellModel * model = [ImageCellModel new];
        model.imagePath = obj;
        [self.modelArray addObject:model];
    }];
}
-(void)p_randomModelArray{

    [self.modelArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [[obj1 description] compare:[obj2 description]];
        } else {
            return [[obj2 description] compare:[obj1 description]];
        }
    }];
    
    NSLog(@"%d",(int)self.modelArray.count);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
