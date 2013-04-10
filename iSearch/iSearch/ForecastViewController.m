//
//  ForecastViewController.m
//  iSearch
//
//  Created by AleX on 4/8/13.
//  Copyright (c) 2013 AleX. All rights reserved.
//

#import "ForecastViewController.h"

@interface ForecastViewController ()

@end

@implementation ForecastViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        lblCity.text = @"Lviv";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
