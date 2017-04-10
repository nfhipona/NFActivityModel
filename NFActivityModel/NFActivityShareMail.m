//
//  NFActivityShareMail.m
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import "NFActivityShareMail.h"
#import <MessageUI/MessageUI.h>
#import "NFActivityModelConstants.h"
#import "NFActivityShareMailItem.h"

@interface NFActivityShareMail() <MFMailComposeViewControllerDelegate>

@property (nonatomic, weak) UIViewController *activeViewController;

@property (nonatomic, strong) NFActivityShareMailItem *shareMailItem;

@end

@implementation NFActivityShareMail

/**
 * Initialize with active UIViewController
 */
- (instancetype)initWithViewController:(UIViewController *)viewController {
 
    if (self = [super init]) {
        self.activeViewController = viewController;
    }

    return self;
}

// MARK: - UIActivity Protocols

+ (UIActivityCategory)activityCategory {
    
    return UIActivityCategoryShare;
}

- (UIActivityType)activityType {
    
    return NFShareMailActivityType;
}

- (NSString *)activityTitle {
    
    return NSStringFromClass([NFActivityShareMail class]);
}

- (UIImage *)activityImage {
    
    NSString *imageName = NSStringFromClass([NFActivityShareMail class]);
    UIImage *activityImage = [UIImage imageNamed:imageName];
    
    return activityImage;
}

// MARK: - UIActivity Action Protocols

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    
    // check if there is supported items
    NSArray *filteredItems = [self filterShareMailItemsWithActivityItems:activityItems];
    return filteredItems.count > 0;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    
    // check if there is supported items
    NSArray *filteredItems = [self filterShareMailItemsWithActivityItems:activityItems];
    self.shareMailItem = [filteredItems firstObject];
}

- (void)performActivity {

    MFMailComposeViewController *shareMail = [[MFMailComposeViewController alloc] init];
    
    [shareMail setSubject:self.shareMailItem.mailSubject];
    [shareMail setMessageBody:self.shareMailItem.mailBody isHTML:self.shareMailItem.isHTML];
    
    [shareMail setToRecipients:self.shareMailItem.mailRecipients];
    [shareMail setCcRecipients:self.shareMailItem.mailCcRecipients];
    [shareMail setBccRecipients:self.shareMailItem.mailBccRecipients];
    
    shareMail.mailComposeDelegate = self;
    
    if (self.shareMailItem.attachments) {
        for (NFActivityShareMailIAttachment *attachment in self.shareMailItem.attachments) {
            [shareMail addAttachmentData:attachment.attachmentData mimeType:attachment.attachmentDataMimeType fileName:attachment.attachmentDataFilename];
        }
    }
    
    [self.activeViewController presentViewController:shareMail animated:YES completion:nil];
}

// MARK: - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [controller dismissViewControllerAnimated:YES completion:^{
        // call when done
        [self activityDidFinish:YES];
    }];
}

// MARK: - Helper

- (NSArray *)filterShareMailItemsWithActivityItems:(NSArray *)activityItems {
    
    // define filter and evaluate items
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        
        return [evaluatedObject isKindOfClass:[NFActivityShareMailItem class]];
    }];
    
    NSArray *filteredItems = [activityItems filteredArrayUsingPredicate:predicate];
    return  filteredItems;
}

@end
