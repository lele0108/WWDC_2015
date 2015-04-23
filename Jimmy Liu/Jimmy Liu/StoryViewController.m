//
//  StoryViewController.m
//  Jimmy Liu
//
//  Created by Jimmy Liu on 4/20/15.
//  Copyright (c) 2015 jimmyliu. All rights reserved.
//

#import "StoryViewController.h"
#import "TitleCell.h"
#import "ParagraphCell.h"
#import "QuoteCell.h"
#import "SingleImageCell.h"
#import "DoubleImageCell.h"
#import "TripleImageCell.h"
#import "URBMediaFocusViewController.h"

@interface StoryViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) URBMediaFocusViewController *mediaFocusController;
@end

@implementation StoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contents = self.storyModel[@"contents"];
    
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.hidesBarsOnSwipe = YES;
    
    self.mediaFocusController = [[URBMediaFocusViewController alloc] init];
    self.mediaFocusController.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.storyCellTable.estimatedRowHeight = 2.0;
    self.storyCellTable.rowHeight = UITableViewAutomaticDimension;
    
    CGRect newFrame = self.storyCellTable.tableHeaderView.frame;
    newFrame.size.height = newFrame.size.height / 2 + 100;
    self.storyCellTable.tableHeaderView.frame = newFrame;
    [self.storyCellTable setTableHeaderView:self.storyCellTable.tableHeaderView];
    
    self.storyImage.image = [UIImage imageNamed: self.storyModel[@"image"]];
    self.storyTitle.text = self.storyModel[@"name"];
    self.storyDate.text = self.storyModel[@"date"];
    self.storyLocation.text = self.storyModel[@"location"];
    [self.storyCellTable layoutIfNeeded];
    [self.storyCellTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NSDictionary *content = self.contents[indexPath.row];
    if ([content[@"type"] isEqualToString:@"title"]) {
        static NSString *CellIdentifier = @"titleCell";
        TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TitleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.titleText.text = content[@"text"];
        [cell layoutIfNeeded];
        return cell;

    } else if ([content[@"type"] isEqualToString:@"paragraph"]) {
        static NSString *CellIdentifier = @"paragraphCell";
        ParagraphCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[ParagraphCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.paragraphText.text = @"";
        cell.paragraphText.text = content[@"text"];
        [cell layoutIfNeeded];
        return cell;
    } else if ([content[@"type"] isEqualToString:@"single_image"]) {
        static NSString *CellIdentifier = @"singleImageCell";
        SingleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[SingleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizer setDelegate:self];
        [cell.imageOne addGestureRecognizer:tapGestureRecognizer];
        cell.imageOne.image = [UIImage imageNamed: content[@"image"]];
        cell.imageOne.clipsToBounds = YES;
        [cell layoutIfNeeded];
        return cell;
    } else if ([content[@"type"] isEqualToString:@"double_image"]) {
        static NSString *CellIdentifier = @"doubleImageCell";
        DoubleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[DoubleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        
        cell.imageOne.image = [UIImage imageNamed: content[@"image"][0]];
        cell.imageOne.clipsToBounds = YES;
        UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizer setDelegate:self];
        [cell.imageOne addGestureRecognizer:tapGestureRecognizer];
        UITapGestureRecognizer* tapGestureRecognizerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizerTwo setDelegate:self];
        cell.imageTwo.image = [UIImage imageNamed: content[@"image"][1]];
        cell.imageTwo.clipsToBounds = YES;
        [cell.imageTwo addGestureRecognizer:tapGestureRecognizerTwo];
        [cell layoutIfNeeded];
        return cell;
    } else if ([content[@"type"] isEqualToString:@"triple_image"]) {
        static NSString *CellIdentifier = @"tripleImageCell";
        TripleImageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[TripleImageCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        
        cell.imageOne.image = [UIImage imageNamed: content[@"image"][0]];
        cell.imageOne.clipsToBounds = YES;
        UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizer setDelegate:self];
        [cell.imageOne addGestureRecognizer:tapGestureRecognizer];
        cell.imageTwo.image = [UIImage imageNamed: content[@"image"][1]];
        cell.imageTwo.clipsToBounds = YES;
        UITapGestureRecognizer* tapGestureRecognizerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizerTwo setDelegate:self];
        [cell.imageTwo addGestureRecognizer:tapGestureRecognizerTwo];
        cell.imageThree.image = [UIImage imageNamed: content[@"image"][2]];
        cell.imageThree.clipsToBounds = YES;
        UITapGestureRecognizer* tapGestureRecognizerThree = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDetected:)];
        [tapGestureRecognizerThree setDelegate:self];
        [cell.imageThree addGestureRecognizer:tapGestureRecognizerThree];
        [cell layoutIfNeeded];
        return cell;
    } else {
        static NSString *CellIdentifier = @"quoteCell";
        QuoteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[QuoteCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:CellIdentifier];
        }
        cell.quoteText.text = @"";
        cell.quoteText.text = content[@"text"];
        [cell layoutIfNeeded];
        return cell;
    }
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark: gesture
- (void)tapGestureDetected:(UITapGestureRecognizer *)recognizer
{
        UIImageView* temp = recognizer.view;
        [self.mediaFocusController showImage:temp.image fromView:self.view];
}


@end
