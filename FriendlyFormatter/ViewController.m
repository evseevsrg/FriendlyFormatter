//
//  ViewController.m
//  FriendlyFormatter
//
//  Created by Sergey Evseev on 03/02/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+FriendlyFormatter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self p_runTestExamples];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

- (void)p_runTestExamples {
    
    NSDate *todayDate = [[NSDate alloc] init];
    NSLog(@"Today: %@", [todayDate friendlyFormat]);
    
    NSDate *todayDatePlus4Minutes = [todayDate dateByAddingTimeInterval:60*4];
    NSLog(@"Today (+4 minutes): %@", [todayDatePlus4Minutes friendlyFormat]);
    
    NSDate *yesterdayDate = [todayDate dateByAddingTimeInterval: -86400.0];
    NSLog(@"Yesterday: %@", [yesterdayDate friendlyFormat]);
    
    NSDate *aDayAgo = [todayDate dateByAddingTimeInterval: -2*86400.0];
    NSLog(@"A day ago: %@", [aDayAgo friendlyFormat]);
    
    NSDate *twoDayAgo = [todayDate dateByAddingTimeInterval: -3*86400.0];
    NSLog(@"Two days ago: %@", [twoDayAgo friendlyFormat]);
}

@end
