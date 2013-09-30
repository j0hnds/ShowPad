//
//  ExhibitorEntryViewController.m
//  ShowPad
//
//  Created by David Sieh on 9/29/13.
//  Copyright (c) 2013 David Sieh. All rights reserved.
//

#import "ExhibitorEntryViewController.h"
#import "Exhibitor.h"

@interface ExhibitorEntryViewController ()

@end

@implementation ExhibitorEntryViewController

@synthesize exhibitor=_exhibitor;
@synthesize delegate=_delegate;

@synthesize tfFirstName=_tfFirstName;
@synthesize tfLastName=_tfLastName;
@synthesize tfAddressLine1=_tfAddressLine1;
@synthesize tfAddressLine2=_tfAddressLine2;
@synthesize tfCity=_tfCity;
@synthesize tfState=_tfState;
@synthesize tfPostalCode=_tfPostalCode;
@synthesize tfPhone=_tfPhone;
@synthesize tfFax=_tfFax;
@synthesize tfCell=_tfCell;
@synthesize tfEmail=_tfEmail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (self.exhibitor) {
        // The caller passed in an exhibitor. Let's pre-seed all the fields
        // with the relevant data.
        if (self.exhibitor.firstName && self.exhibitor.firstName != (id)[NSNull null])
            self.tfFirstName.text = self.exhibitor.firstName ;
        if (self.exhibitor.lastName && self.exhibitor.lastName != (id)[NSNull null])
            self.tfLastName.text = self.exhibitor.lastName;
        if (self.exhibitor.address1 && self.exhibitor.address1 != (id)[NSNull null])
            self.tfAddressLine1.text = self.exhibitor.address1;
        if (self.exhibitor.address2 && self.exhibitor.address2 != (id)[NSNull null])
            self.tfAddressLine2.text = self.exhibitor.address2;
        if (self.exhibitor.city && self.exhibitor.city != (id)[NSNull null])
            self.tfCity.text = self.exhibitor.city;
        if (self.exhibitor.state && self.exhibitor.state != (id)[NSNull null])
            self.tfState.text = self.exhibitor.state;
        if (self.exhibitor.postalCode && self.exhibitor.postalCode != (id)[NSNull null])
            self.tfPostalCode.text = self.exhibitor.postalCode;
        if (self.exhibitor.phone && self.exhibitor.phone != (id)[NSNull null])
            self.tfPhone.text = self.exhibitor.phone;
        if (self.exhibitor.fax && self.exhibitor.fax != (id)[NSNull null])
            self.tfFax.text = self.exhibitor.fax;
        if (self.exhibitor.cell && self.exhibitor.cell != (id)[NSNull null])
            self.tfCell.text = self.exhibitor.cell;
        if (self.exhibitor.email && self.exhibitor.email != (id)[NSNull null])
            self.tfEmail.text = self.exhibitor.email;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAndDismiss:(id)sender {
    // TODO: Do something about saving the exhibitor here.
    if (! self.exhibitor) {
        self.exhibitor = [Exhibitor createExhibitorWithId:0];
    }
    
    // Set the attributes of the exhibitor...
    self.exhibitor.firstName = self.tfFirstName.text;
    self.exhibitor.lastName = self.tfLastName.text;
    self.exhibitor.address1 = self.tfAddressLine1.text;
    self.exhibitor.address2 = self.tfAddressLine2.text;
    self.exhibitor.city = self.tfCity.text;
    self.exhibitor.state = self.tfState.text;
    self.exhibitor.postalCode = self.tfPostalCode.text;
    self.exhibitor.phone = self.tfPhone.text;
    self.exhibitor.fax = self.tfFax.text;
    self.exhibitor.cell = self.tfCell.text;
    self.exhibitor.email = self.tfEmail.text;
    
    // Tell the caller about the exhibitor
    if (self.delegate) {
        [self.delegate exhibitorEditingComplete:self.exhibitor];
    }
    
    [self justDismiss:sender];
}

- (IBAction)justDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
