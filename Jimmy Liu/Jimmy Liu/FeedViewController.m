//
//  FeedViewController.m
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedTableCell.h"
#import "StoryViewController.h"
#import "KLCPopup.h"
#import "PopUpView.h"

@interface FeedViewController() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Futura-Medium" size:20],
      NSFontAttributeName, nil]];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"story" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.data = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    UIView* contentView = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil][0];
    contentView.frame = CGRectMake(0.0, 0.0, 300.0, 400.0);
    
    KLCPopup* popup = [KLCPopup popupWithContentView:contentView];
    [popup show];
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.hidesBarsOnSwipe = NO;
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"storyCell";
    
    FeedTableCell *cell = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[FeedTableCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSDictionary *story = [self.data objectAtIndex: [indexPath row]];
    cell.titleText.text = story[@"name"];
    
    cell.despText.text = [NSString stringWithFormat:@"%@ · %@", story[@"date"], story[@"location"]];
    
    UIImage *bgPhoto = [UIImage imageNamed: story[@"image"]];
    
    cell.bgImage.image = bgPhoto;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showStory"])
    {
        StoryViewController *storyViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.feedTableView
                                    indexPathForSelectedRow];
        
        storyViewController.storyModel = [self.data objectAtIndex: [myIndexPath row]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPop:(id)sender {
    UIView* contentView = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil][0];
    contentView.frame = CGRectMake(0.0, 0.0, 300.0, 400.0);
    
    KLCPopup* popup = [KLCPopup popupWithContentView:contentView];
    [popup show];
}

@end
