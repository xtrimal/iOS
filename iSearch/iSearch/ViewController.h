//
//  ViewController.h
//  iSearch
//
//  Created by AleX on 4/2/13.
//  Copyright (c) 2013 AleX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastViewController.h"

@interface ViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSArray *originalData;
    NSMutableArray *searchData;
    
    UISearchBar *searchBar;
    UISearchDisplayController *searchDisplayController;
}

@end
