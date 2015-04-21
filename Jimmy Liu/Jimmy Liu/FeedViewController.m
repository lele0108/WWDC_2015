//
//  FeedViewController.m
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedTableCell.h"

@interface FeedViewController() <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.story = [[NSArray alloc]
                  initWithObjects:@"Everyone has a Hello World. This is mine.",
                  @"Those who disrupt are those who make the future",
                  @"Art and technology go hand in hand", nil];
    self.desp = [[NSArray alloc]
                  initWithObjects:@"Janurary 8th 1998 · Beijing China",
                  @"March 8th 2013 · San Francisco California",
                  @"December 21st 2014 · Cupertino, California", nil];
    self.images = [[NSArray alloc]
                 initWithObjects:@"test.jpg",
                 @"test.jpg",
                 @"test.jpg", nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.story count];
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
    cell.titleText.text = [self.story
                           objectAtIndex: [indexPath row]];
    
    cell.despText.text = [self.desp
                            objectAtIndex:[indexPath row]];
    
    UIImage *bgPhoto = [UIImage imageNamed:
                         [self.images objectAtIndex: [indexPath row]]];
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
