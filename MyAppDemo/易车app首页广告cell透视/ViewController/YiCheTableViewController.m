//
//  YiCheTableViewController.m
//  MyAppDemo

/*                         实现思路
 
    1, 在需要透视的cell 上设置一个scrollview  在scrollView上添加一个图片
    2, 在tablview滑动时 更新scrollview的contentOffset 分为 cell滑入屏幕 cell在屏幕中 cell开始滑出屏幕三种青情况

 */
//  Created by yao on 2019/8/28.
//  Copyright © 2019 yao. All rights reserved.
//

#import "YiCheTableViewController.h"
#import "YiCheTableViewCell.h"
@interface YiCheTableViewController ()

@end
#define HEIGHT 150
@implementation YiCheTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置高度为自适应
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //刷新cell 如果不刷新,第一次进入页面时会只显示图片的顶部,而不是显示对应位置, 滑动下才会出现对应的位置
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 5 || indexPath.row == 15) {
        static NSString *cellID = @"YiCheTableViewCell";
        //因为xib 中scroolview设置了高度为150 所以cell的高度为150
        YiCheTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil) {
            cell = [[NSBundle mainBundle] loadNibNamed:cellID owner:nil options:nil][0];
        }
        [cell setContentWithImage:K_Image(@"汽车.jpg")];
        return cell;
    }
    static NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//当ctableview滑动时
-(void)scrollViewDidScroll:(UITableView *)scrollView{
    //获取可见的cell
    NSArray *visCells = scrollView.visibleCells;
    //遍历可见的cell
    [visCells enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //如果是透视cell 则取出,进行设置
        if ([obj isKindOfClass:[YiCheTableViewCell class]]) {
            YiCheTableViewCell *yicheCell = obj;
            //获取图片高度与cell高度的 差(图片的高度 - cell的高度)
            CGFloat maxOff = yicheCell.imageHeight.constant - HEIGHT; //300
            // 获取cell起点到tablview的顶部的高度
            CGFloat cellToTopOff = yicheCell.frame.origin.y - scrollView.contentOffset.y;
            //获取cell底部到图片底部的差
            CGFloat scrollOff = maxOff - cellToTopOff;
//            CGFloat scrollOff = scrollView.contentOffset.y - yicheCell.frame.origin.y + yicheCell.imageHeight.constant - HEIGHT;
            //判断透明视图是否开始滑出屏幕
            if (maxOff <= scrollOff) {
                //透明视图开始滑出屏幕  那么图片应该显示的是最顶部
                [yicheCell.scrollView setContentOffset:CGPointMake(0,0)];
            }else if (scrollOff < 0){
                //透明视图 开始滑入屏幕 并且图片的高度小与cell到顶部的高度  图片应该显示图片的底部
                [yicheCell.scrollView setContentOffset:CGPointMake(0,maxOff)];
                
            } else{
                //透明视图 在屏幕中 并且图片的高度大于与cell到顶部的高度 图片应该显示对应的位置
                [yicheCell.scrollView setContentOffset:CGPointMake(0,(maxOff - scrollOff))];
            }
        }
    }];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
