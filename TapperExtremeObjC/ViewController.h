//
//  ViewController.h
//  TapperExtremeObjC
//
//  Created by Jeremy Broutin on 5/13/17.
//  Copyright © 2017 Jeremy Broutin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic) int maxTaps;
@property (nonatomic) int currentTaps;

@end

