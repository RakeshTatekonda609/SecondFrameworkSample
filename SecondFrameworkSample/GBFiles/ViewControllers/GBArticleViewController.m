//
//  GBArticleViewController.m
//  GBApplication
//
//  Created by Rakesh Tatekonda on 04/03/17.
//  Copyright © 2017 Rakesh Tatekonda. All rights reserved.
//

//ViewControllers
#import "GBArticleViewController.h"

//Managaers
#import "GBAPIManager.h"

//Models
#import "GBArticleResponseObject.h"

//Cells
#import "GBArticleTableViewCell.h"

@interface GBArticleViewController () <UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *articleTableView;

@property (nonatomic , strong) NSArray *dataArray;
@property (nonatomic , assign) NSInteger expandedIndex;
@property (nonatomic , assign) BOOL isCellSelected;

@end

static NSString *kIdentifierArticleTableCell = @"GBArticleTableViewCell";

@implementation GBArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self initializeVariables];
    [self fetchData];
    // Do any additional setup after loading the view from its nib.
}

-(void)setUpUI
{
    self.title = self.sourceObjectModel.sourceName;
    [self setUpTableView];
    [self setSegments:self.sourceObjectModel.sortBysAvailable];
}

-(void)setUpTableView{
    self.articleTableView.delegate = self;
    self.articleTableView.dataSource = self;
    NSBundle* frameworkBundle = [NSBundle bundleForClass:[self class]];

    [self.articleTableView registerNib:[UINib nibWithNibName:kIdentifierArticleTableCell bundle:frameworkBundle] forCellReuseIdentifier:kIdentifierArticleTableCell];
    self.articleTableView.rowHeight = UITableViewAutomaticDimension;
    self.articleTableView.estimatedRowHeight = 44.0;
}

- (void)setSegments:(NSArray *)segments
{
    [self.segmentedControl removeAllSegments];
    
    for (NSString *segment in segments) {
        [self.segmentedControl insertSegmentWithTitle:segment atIndex:self.segmentedControl.numberOfSegments animated:NO];
    }
    self.segmentedControl.selectedSegmentIndex = 0;
}

-(void)initializeVariables{
    _isCellSelected = NO;
}

- (IBAction)segmentedControlTapped:(id)sender {
    [self fetchData];
}

-(void)fetchData
{
    [self showLoadingIndicator];
    __weak GBArticleViewController *weakSelf = self;

    [[GBAPIManager sharedInstance] fetchNewsArticlesWithSource:self.sourceObjectModel.sourceID andSortBy:[self.sourceObjectModel.sortBysAvailable objectAtIndex:self.segmentedControl.selectedSegmentIndex] CompletionBlock:^(NSDictionary *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
            GBArticleResponseObject *responseObject = [[GBArticleResponseObject alloc] initWithDictionary:data];
            weakSelf.dataArray = responseObject.articles;
            dispatch_async(dispatch_get_main_queue(), ^(void){
                [weakSelf.articleTableView reloadData];
                [weakSelf dismissLoadingIndicator];
            });
        });
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifierArticleTableCell forIndexPath:indexPath];
    [cell configureCellWithData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        _isCellSelected = YES;
        NSInteger previousExpandedIndex = _expandedIndex;
        _expandedIndex = indexPath.row;
    
        [self.articleTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:
                                                      [NSIndexPath indexPathForRow:previousExpandedIndex inSection:0],
                                                      [NSIndexPath indexPathForRow:_expandedIndex inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_expandedIndex == indexPath.row && _isCellSelected) {
        return UITableViewAutomaticDimension;
    }
    return 105;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_expandedIndex == indexPath.row && _isCellSelected) {
        return UITableViewAutomaticDimension;
    }
    return 105;
}


@end
