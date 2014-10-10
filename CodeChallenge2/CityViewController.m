//
//  CityViewController.m
//  CodeChallenge2
//
//  Created by S on 10/10/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateTextField;

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityLabel.text = self.citySeg.name;
    self.stateLabel.text = self.citySeg.state;

    self.cityTextField.hidden = YES;
    self.stateTextField.hidden = YES;
}

- (IBAction)onEditButtonTapped:(id)sender {
    self.cityLabel.hidden = YES;
    self.stateLabel.hidden = YES;
    self.cityTextField.hidden = NO;
    self.cityTextField.hidden = NO;
    self.cityTextField.text = self.citySeg.name;
    self.stateTextField.text = self.citySeg.state;
}

- (IBAction)onWikiTapGesture:(UITapGestureRecognizer *)sender
{

    

}







#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if (self.cityLabel.text != self.cityTextField.text)
    {
        self.citySeg.name = self.cityTextField.text;
        self.cityLabel.text = self.citySeg.name;
        self.cityLabel.hidden = NO;
        self.cityTextField.hidden = YES;
    }
    if (self.stateLabel.text != self.stateTextField.text)
    {
        self.citySeg.state = self.stateTextField.text;
        self.stateLabel.text = self.citySeg.state;
        self.stateLabel.hidden = NO;
        self.stateTextField.hidden = YES;
    }
    return YES;
}


@end
