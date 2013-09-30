//
//  ExhibitorSummaryViewController.h
//  ShowPad
//
//  Created by David Sieh on 9/29/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExhibitorEntryViewController.h"

@class Exhibitor;

@interface ExhibitorSummaryViewController : UIViewController <ExhibitorEntryViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblExhibitorInfo;

@property (strong, nonatomic) Exhibitor *exhibitor;

@property (readonly) BOOL exhibitorModified;

- (IBAction)dismissSummary:(id)sender;
@end
