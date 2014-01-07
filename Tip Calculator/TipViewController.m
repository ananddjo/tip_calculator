//
//  TipViewController.m
//  Tip Calculator
//
//  Created by Anand Joshi on 1/6/14.
//  Copyright (c) 2014 Yahoo! Inc. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)onSettingsButton;
- (int)loadDefaultTipIndex;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    self.tipControl.selectedSegmentIndex = [self loadDefaultTipIndex];
    [self updateValues];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

/*
 * Calculate Tip
 */
- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$ %.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$ %.2f", totalAmount];
}

/*
 * Navigate to Settings View
 */
- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

/*
 * Load Tip from defaults
 */
- (int)loadDefaultTipIndex {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipIndex"];
    return intValue;
}

/*
 * Update Tip after switching between Settings and main window
 */
- (void)viewWillAppear:(BOOL)animated {
    self.tipControl.selectedSegmentIndex = [self loadDefaultTipIndex];
}


@end
