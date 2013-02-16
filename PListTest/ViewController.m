//
//  ViewController.m
//  PListTest
//
//  Created by Paul Sorenson on 2/16/13.
//  Copyright (c) 2013 Paul Sorenson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set the target filename
    targetFilename = @"test.plist";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getPathToDocuments {
    // Returns the path to the Documents folder within the app's sandbox.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    NSString *aPath = [paths objectAtIndex:0];
    
    return aPath;

}

- (NSString *) getPathToFile: (NSString *) fileName {
    // Returns a fully qualified path to the specified filename.

    NSString *aPath = [self getPathToDocuments];
    NSString *fName = [aPath stringByAppendingPathComponent:fileName];

    return fName;
    
}

- (IBAction) writeButtonPressed: (id) sender {
    // Creates an array of 5 numbers and writes them to a plist.
    
    // Just testing writing to a plist...
    testData = [[NSMutableArray alloc] initWithCapacity:5];
    
    for (int idx=0; idx<5; idx++) {
        NSString *obj = [[NSString alloc] initWithFormat:@"%d", idx];
        [testData addObject:obj];
    }
    
    NSString *fName = [self getPathToFile:targetFilename];
    [testData writeToFile:fName atomically:YES];
    
    NSString *msg = [[NSString alloc] initWithFormat:@"Done writing %d strings.",
                                                    [testData count]];
    writeDoneTextField.text = msg;
    
}

- (IBAction) readButtonPressed:(id)sender {
    // Retrieves the contents of the test filename, displaying it to the user.
    
    NSString *fName = [self getPathToFile:targetFilename];
    testData = [[NSMutableArray alloc] initWithContentsOfFile:fName];
    
    NSMutableString *msg = [[NSMutableString alloc] initWithString:@"Read: "];
    
    for (int idx=0; idx<[testData count]; idx++) {
        [msg appendFormat:@" %@", [testData objectAtIndex:idx]];
        
    }

    readDoneTextField.text = msg;
    
}


@end
