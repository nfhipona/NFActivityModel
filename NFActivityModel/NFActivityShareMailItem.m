//
//  NFActivityShareMailItem.m
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import "NFActivityShareMailItem.h"

@implementation NFActivityShareMailItem

- (instancetype)initWithShareMailTitle:(NSString *)mailTitle mailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML {
    
    if (self = [super init]) {
        
        self.mailSubject = mailSubject;
        self.mailBody = mailBody;
        self.isHTML = isHTML;
    }
    
    return self;
}

- (instancetype)initWithShareMailTitle:(NSString *)mailTitle mailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML mailRecipients:(NSArray *)mailRecipients mailCcRecipients:(NSArray *)mailCcRecipients mailBccRecipients:(NSArray *)mailBccRecipients {
    
    if (self = [self initWithShareMailTitle:mailTitle mailSubject:mailSubject mailBody:mailBody isHTML:isHTML]) {
        
        self.mailRecipients = mailRecipients;
        self.mailCcRecipients = mailCcRecipients;
        self.mailBccRecipients = mailBccRecipients;
    }
    
    return self;
}


@end
