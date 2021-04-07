//
//  ViewController.m
//  CGXAlertVIewControllerDemo
//
//  Created by CGX on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "ViewController.h"
//屏幕宽
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
//屏幕高
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

///NavBar高度
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0f
///导航栏高度
#define kTopHeight  (kStatusBarHeight + kNavBarHeight)
///tab安全区域
#define kSafeHeight    ((kStatusBarHeight>20) ? 34.0f : 0.0f)
///导航栏安全区域
#define kNavBarSafetyZone         ((kStatusBarHeight>20) ? 44.0f : 0.0f)
#define kTabBarHeight  ((kStatusBarHeight>20) ? (49.0f+34.0f) : 49.0f)
#define kVCHeight (ScreenHeight-kTopHeight-kTabBarHeight)
#define kSafeVCHeight (kStatusBarHeight>20?(ScreenHeight-kTopHeight-34):(ScreenHeight-kTopHeight))

#import "CGXAlertViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray<NSString *> *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-kTopHeight-kTabBarHeight) style:UITableViewStyleGrouped];;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.scrollsToTop = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:_tableView];
    self.dataArray = [NSMutableArray arrayWithObjects:
                      @"Alert默认色调",
                      @"Alert修改色调",
                      @"QQ登录",
                      @"微信好友",
                      nil];
    [_tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    if (headerView == nil) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    }
    headerView.contentView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    if (footerView == nil) {
        footerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    }
    return footerView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.text = self.dataArray[indexPath.section];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *title = self.dataArray[indexPath.section];
    if ([title isEqualToString:@"Alert默认色调"]) {
        [CGXAlertViewController showAlertTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
            NSLog(@"%@--%@--%@",title,message,btnStr);
        }];
    } else if ([title isEqualToString:@"Alert修改色调"]){
        [CGXAlertViewController showAlertTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] TitleBlock:^(CGXAlertTitleModel *titleModel) {
            titleModel.titleFont = [UIFont systemFontOfSize:20];
            titleModel.titleColor = [UIColor blackColor];
            titleModel.messageFont = [UIFont systemFontOfSize:14];
            titleModel.messageColor = [UIColor redColor];
        } ActionModleBlock:^(CGXAlertActionModel *actionModel) {
            actionModel.titleColor = [UIColor redColor];
        } SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
            NSLog(@"%@--%@--%@",title,message,btnStr);
        }];
    } else if ([title isEqualToString:@"QQ登录"]){
        
        [CGXAlertViewController showActionTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
            NSLog(@"%@--%@--%@",title,message,btnStr);
        }];
    } else if ([title isEqualToString:@"微信好友"]){
        
        [CGXAlertViewController showActionTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] TitleBlock:^(CGXAlertTitleModel *titleModel) {
            titleModel.titleFont = [UIFont systemFontOfSize:20];
            titleModel.titleColor = [UIColor blackColor];
        } ActionModleBlock:^(CGXAlertActionModel *actionModel) {
            actionModel.titleColor = [UIColor redColor];
        } SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
            NSLog(@"%@--%@--%@",title,message,btnStr);
        }];
    }
    
}


@end
