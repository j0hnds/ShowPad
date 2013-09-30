//
//  ExhibitorEntryViewController.h
//  ShowPad
//
//  Created by David Sieh on 9/29/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Exhibitor;
@protocol ExhibitorEntryViewDelegate;

@interface ExhibitorEntryViewController : UIViewController
@property (strong, nonatomic) Exhibitor *exhibitor;
@property (strong, nonatomic) id<ExhibitorEntryViewDelegate> delegate;

// The fields...
@property (strong, nonatomic) IBOutlet UITextField *tfFirstName;
@property (strong, nonatomic) IBOutlet UITextField *tfLastName;
@property (strong, nonatomic) IBOutlet UITextField *tfAddressLine1;
@property (strong, nonatomic) IBOutlet UITextField *tfAddressLine2;
@property (strong, nonatomic) IBOutlet UITextField *tfCity;
@property (strong, nonatomic) IBOutlet UITextField *tfState;
@property (strong, nonatomic) IBOutlet UITextField *tfPostalCode;
@property (strong, nonatomic) IBOutlet UITextField *tfFax;
@property (strong, nonatomic) IBOutlet UITextField *tfCell;
@property (strong, nonatomic) IBOutlet UITextField *tfEmail;
@property (strong, nonatomic) IBOutlet UITextField *tfPhone;

// The actions...
- (IBAction)saveAndDismiss:(id)sender;
- (IBAction)justDismiss:(id)sender;
@end

@protocol ExhibitorEntryViewDelegate <NSObject>

- (void)exhibitorEditingComplete:(Exhibitor *)exhibitor;

@end
