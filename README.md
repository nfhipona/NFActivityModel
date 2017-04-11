# NFActivityModel
A custom 'UIActivity'


## Usage

    NSURL *fileURL = [NSURL URLWithString:pdfFileURL];
    NSData *pdfData = [NSData dataWithContentsOfFile:pdfFileURL];

    NFActivityShareMailIAttachment *shareMailAttachment = [[NFActivityShareMailIAttachment alloc] initWithAttachmentData:pdfData attachmentDataMimeType:@"application/pdf" attachmentDataFilename:pdfFilename];
    
    NSString *taskName = self.reportInfo[@"TaskName"] ?: @"PDF Share";
    NSString *sharingUser = self.reportInfo[@"SharingUser"] ?: @"JV User";
    
    // define ShareMail item
    NSString *mailBody = @"ShareMail Body";
    NFActivityShareMailItem *activityShareMailItem = [[NFActivityShareMailItem alloc] initWithShareMailSubject:taskName mailBody:mailBody isHTML:NO];
    activityShareMailItem.attachments = @[shareMailAttachment];
    
    // create ShareMail with the base view controller
    NFActivityShareMail *shareMail = [[NFActivityShareMail alloc] initWithViewController:self];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[pdfData, fileURL, activityShareMailItem] applicationActivities:@[shareMail]];
    activityViewController.excludedActivityTypes = @[UIActivityTypeMail];
    
    // present to user
    [self presentViewController:activityViewController animated:YES completion:nil];
