//
//  ViewController.m
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import "ViewController.h"
#import "NFActivityShareMail.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showActivityModel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showActivityModel {
    
    NSString *pdfFileName = @"pdfFileName.pdf";
    NSURL *fileURL = [NSURL URLWithString:@"filePath"];
    NSData *pdfData = [NSData dataWithContentsOfFile:@"filePath"];
    
    NFActivityShareMailIAttachment *shareMailAttachment = [[NFActivityShareMailIAttachment alloc] initWithAttachmentData:pdfData attachmentDataMimeType:@"application/pdf" attachmentDataFilename:pdfFileName];
    
    NSString *taskName = @"PDF Share";
    NSString *sharingUser = @"NFActivityShareMail User";
    
    NSString *mailBody = [NSString stringWithFormat:@"This is body shared by: %@ for %@.", sharingUser, taskName];
    
    NFActivityShareMailItem *activityShareMailItem = [[NFActivityShareMailItem alloc] initWithShareMailTitle:taskName mailSubject:taskName mailBody:mailBody isHTML:NO];
    activityShareMailItem.attachments = @[shareMailAttachment];
    
    NFActivityShareMail *shareMail = [[NFActivityShareMail alloc] initWithViewController:self];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[mailBody, pdfData, fileURL, activityShareMailItem] applicationActivities:@[shareMail]];
    
    NSArray *excludeActivities = @[UIActivityTypeMail];
    activityViewController.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityViewController animated:YES completion:nil];
}


@end
