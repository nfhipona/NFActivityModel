# NFActivityModel
A custom 'UIActivity'


## Usage

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

