//
//  ViewController.m
//  iSearch
//
//  Created by AleX on 4/2/13.
//  Copyright (c) 2013 AleX. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        NSArray *states1 = [[NSArray alloc] initWithObjects:@"Montgomery, AL",
                            @"Phoenix, AZ",
                            @"Little, AR",
                            @"Sacramento, CA",
                            @"Denver, CO",
                            @"Hartford, CT",
                            @"Dover, DE",
                            @"Tallahassee, FL",
                            @"Atlanta, GA",
                            @"Boise, ID",
                            @"Springfield, IL",
                            @"Indianapolis, IN",
                            @"Des Moines, IA",
                            @"Topeka, KS",
                            @"Frankfort, KY",
                            @"Baton Rouge, LA",
                            @"Augusta, ME",
                            @"Annapolis, MD",
                            @"Boston, MA",
                            @"Lansing, MI",
                            @"Saint Paul, MN",
                            @"Jackson, MS",
                            @"Jefferson City, MO",
                            @"Helena, MT",
                            @"Lincoln, NE",
                            @"Carson City, NV",
                            @"Concord, NH",
                            @"Trenton, NJ",
                            @"Santa Fe, NM",
                            @"Albany, NY",
                            @"Raleigh, NC",
                            @"Bismarck, ND",
                            @"Columbus, OH",
                            @"Oklahoma City, OK",
                            @"Salem, OR",
                            @"Harrisburg, PA",
                            @"Providence, RI",
                            @"Columbia, SC",
                            @"Pierre, SD",
                            @"Nashville, TN",
                            @"Austin, TX",
                            @"Salt Lake City, UT",
                            @"Montpelier, VT",
                            @"Richmond, VA",
                            @"Olympia, WA",
                            @"Charleston, WV",
                            @"Madison, WI",
                            @"Cheyenne, WY",nil];
        
        NSArray *states2 = [[NSArray alloc] initWithObjects:@"Juneau, AK",
                            @"Honolulu, HI", nil];
        originalData = [[NSArray alloc] initWithObjects:states1, states2, nil];
        
        searchData = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar
                                                                contentsController:self];
    
    searchDisplayController.delegate = self;
    searchDisplayController.searchResultsDataSource = self;
    
    self.tableView.tableHeaderView = searchBar;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int sections = 0;
    
    if (tableView == self.tableView) {
        sections = [originalData count];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        sections = [searchData count];
    }
    return sections;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rows = 0;
    
    if (tableView == self.tableView) {
        rows = [[originalData objectAtIndex:section] count];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        rows = [[searchData objectAtIndex:section] count];
    }
    
    return rows;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"contiguous states";
            break;
        case 1:
            return @"non-contiguous states";
            break;
              
        default:
            return @"";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    NSString *txtCellLable = @"";
    if (tableView == self.tableView) {
        txtCellLable = [[originalData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        txtCellLable = [[searchData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = txtCellLable;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *forecastVC = [[ForecastViewController alloc] initWithNibName:@"ForecastViewController" bundle:Nil];
//    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:forecastVC];
//    [self presentModalViewController: navController animated: YES];
    if(self.navigationController)
        [self.navigationController pushViewController:forecastVC animated:YES];
    else NSLog(@"navigationController:%@",nil);
}

#pragma mark - searchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [searchData removeAllObjects];
    
    NSArray *group;
    
    for(group in originalData)
    {
        NSMutableArray *newGroup = [[NSMutableArray alloc] init];
        NSString *element;
        
        for(element in group)
        {
            NSRange range = [element rangeOfString:searchString options:NSCaseInsensitiveSearch];
            
            if (range.length > 0) {
                [newGroup addObject:element];
            }
        }
        
        if ([newGroup count] > 0) {
            [searchData addObject:newGroup];
        }
        
    }
    
    return YES;
}

#pragma mark - other methods

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationMaskPortrait|
            UIInterfaceOrientationLandscapeLeft|
            UIInterfaceOrientationLandscapeRight);
}
@end
