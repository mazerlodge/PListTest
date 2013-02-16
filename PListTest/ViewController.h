//
//  ViewController.h
//  PListTest
//
//  Created by Paul Sorenson on 2/16/13.
//  Copyright (c) 2013 Paul Sorenson. All rights reserved.
//
//  Comment to test push.

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

    // Name of the plist file
    NSString *targetFilename;
    
    // Holds the data to be written
    NSMutableArray *testData;
    
    // Messages to the user updated after each step
    IBOutlet UITextField *writeDoneTextField;
    IBOutlet UITextField *readDoneTextField;
    
    
    
}

// Buttons pressed to activate each step
- (IBAction) writeButtonPressed: (id) sender;
- (IBAction) readButtonPressed:(id)sender;


@end
