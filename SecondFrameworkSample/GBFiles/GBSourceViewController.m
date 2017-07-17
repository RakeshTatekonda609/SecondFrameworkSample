//
//  ViewController.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

//ViewControllers
#import "GBSourceViewController.h"
#import "GBArticleViewController.h"

//Managers
#import "GBAPIManager.h"

//Models
#import "GBSourceResponseObject.h"

//Cells
#import "GBSourceTableViewCell.h"

#import "GBUtility.h"

@interface GBSourceViewController () <UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *sourceTableView;
@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@property (nonatomic , strong) NSArray *dataArray;

@end

static NSString *kIdentifiersSourceTableCell = @"GBSourceTableViewCell";

@implementation GBSourceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self fetchDataOnLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI Configuration Methods

-(void)setUpUI
{
    self.title = @"Sources";
    [self setUpTableView];
}

-(void)setUpTableView
{
    self.sourceTableView.delegate = self;
    self.sourceTableView.dataSource = self;
    [self.sourceTableView registerNib:[UINib nibWithNibName:kIdentifiersSourceTableCell bundle:[GBUtility getBundleForFramework]] forCellReuseIdentifier:kIdentifiersSourceTableCell];
    self.sourceTableView.rowHeight = UITableViewAutomaticDimension;
    self.sourceTableView.estimatedRowHeight = 44.0;
}

#pragma mark API Methods

-(void)fetchDataOnLoad
{
    [self showLoadingIndicator];
    __weak GBSourceViewController *weakSelf = self;

    [[GBAPIManager sharedInstance] fetchNewsSourcesWithcompletionBlock:^(NSDictionary *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error is %@",error);
        }else if(data)
        {
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
                GBSourceResponseObject *responseObject = [[GBSourceResponseObject alloc] initWithDictionary:data];
                weakSelf.dataArray = responseObject.sources;
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    [weakSelf.view sendSubviewToBack:self.loadingLabel];
                    [weakSelf.sourceTableView reloadData];
                    [weakSelf dismissLoadingIndicator];
                });
            });
        }
    }];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBSourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifiersSourceTableCell forIndexPath:indexPath];
    [cell configureCellWithData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GBArticleViewController *articleVC = [self.storyboard instantiateViewControllerWithIdentifier:@"articleVC"];
    articleVC.sourceObjectModel = [self.dataArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:articleVC animated:YES];
}

+ (void)showSignInVCAsModalToVC:(UIViewController *)viewController animate:(BOOL)animated andFromBuyFlow:(BOOL)fromBuyFlow
{
    NSBundle* frameworkBundle = [NSBundle bundleForClass:[self class]];

    UIStoryboard *storyboard =
    [UIStoryboard storyboardWithName:@"GBMain"
                              bundle:[GBUtility getBundleForFramework]];
    GBSourceViewController *articleVC = [storyboard instantiateViewControllerWithIdentifier:@"sourceVC"];

    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:articleVC];
    [viewController presentViewController:navigationController animated:animated completion:nil];
}

@end
