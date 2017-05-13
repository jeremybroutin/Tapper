//
//  ViewController.m
//  TapperExtremeObjC
//
//  Created by Jeremy Broutin on 5/13/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImg;
@property (weak, nonatomic) IBOutlet UITextField *howManyTapsTxt;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *tapBtn;
@property (weak, nonatomic) IBOutlet UILabel *tapsLbl;

@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _howManyTapsTxt.delegate = self;
}

#pragma mark - IBActions

- (IBAction)onCoinTapped:(id)sender {
    _currentTaps++;
    [self updateTapsLbl];
    if ([self isGameOver]) {
        [self restartGame];
    }
}

- (IBAction)onPlayBtnPressed:(id)sender {
    if (_howManyTapsTxt.text != nil && ![_howManyTapsTxt.text isEqualToString:@""]) {
        [self showPlayUI:YES];
        _maxTaps = _howManyTapsTxt.text.intValue;
        _currentTaps = 0;
        [self updateTapsLbl];
    }
}

#pragma mark - Helper functions

- (void)updateTapsLbl {
    [_tapsLbl setText:[NSString stringWithFormat:@"%d Taps", _currentTaps]];
}

- (BOOL)isGameOver {
    return _currentTaps >= _maxTaps;
}

- (void)restartGame {
    _maxTaps = 0;
    [_howManyTapsTxt setText:@""];
    [self showPlayUI:NO];
}

- (void)showPlayUI:(BOOL) value {
    [_logoImg setHidden:value];
    [_playBtn setHidden:value];
    [_howManyTapsTxt setHidden:value];
    
    [_tapBtn setHidden:!value];
    [_tapsLbl setHidden:!value];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
