//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by Anand Joshi on 1/7/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)tipChange:(UISegmentedControl *)sender;
- (void) setDefaultSettings;
- (void) loadDefaultSettings;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadDefaultSettings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipChange:(UISegmentedControl *)sender {
    [self setDefaultSettings];
}

- (void) setDefaultSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"defaultTipIndex"];
    [defaults synchronize];
}

- (void) loadDefaultSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    self.defaultTipControl.selectedSegmentIndex = intValue;
}


@end
