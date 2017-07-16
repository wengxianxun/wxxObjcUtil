//
//  IapViewController.m
//  wxxObjcUtil
//
//  Created by game just on 2017/7/16.
//  Copyright © 2017年 game just. All rights reserved.
//

#import "IapViewController.h"
#import "WxxIapStore.h"
@interface IapViewController ()<WxxIapStoreDelegate>
@property (nonatomic,strong)WxxIapStore *wiapstore;
@end

@implementation IapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *buyBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
    // Do any additional setup after loading the view.
}

-(void)buy{
    if (!self.wiapstore) {
        self.wiapstore = [[WxxIapStore alloc]init];
        self.wiapstore.delegate = self;
        
    }
    [self.wiapstore wxxBuyStartWithProductIdentifiers:[self.wiapstore wxxGetProductIdByAppbundleIdentifier:@"6"]];//开始购买
}

#pragma mark WxxIapStoreDelegate
-(void)WxxIapBuyResult:(BOOL)buyResult{
    
    if (buyResult) {
        NSLog(@"成功");
    }else{
        NSLog(@"失败");
    }
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
