//
//  GBBaseController.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

#import "GBBaseViewController.h"

@interface GBBaseViewController ()

@property (nonatomic , strong) UIActivityIndicatorView *spinner;

@end

@implementation GBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIActivityIndicatorView *)spinnerView{
    if (!_spinner){
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.spinner.center = self.navigationController.view.center;
        self.spinner.hidesWhenStopped = YES;
    }
    return _spinner;
}


-(void)showLoadingIndicator
{
    [self.view addSubview:[self spinnerView]];
    [self.spinner startAnimating];
}


-(void)dismissLoadingIndicator
{
    [self.spinner stopAnimating];
}


@end
