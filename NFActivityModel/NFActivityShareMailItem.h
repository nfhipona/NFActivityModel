//
// NFActivityShareMailItem.h
// NFActivityModel
//
// Created by Neil Francis Hipona on 4/10/17.
// Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import "NFActivityItem.h"
#import "NFActivityShareMailIAttachment.h"

@interface NFActivityShareMailItem : NFActivityItem

// MARK: - data

@property (nonatomic, strong) NSString *mailBody;
@property (nonatomic, strong) NSString *mailSubject;
@property (nonatomic) BOOL isHTML;

@property (nonatomic, strong) NSArray *mailRecipients;
@property (nonatomic, strong) NSArray *mailCcRecipients;
@property (nonatomic, strong) NSArray *mailBccRecipients;

@property (nonatomic, strong) NSArray<NFActivityShareMailIAttachment *> *attachments;

// MARK: - instancetype

- (instancetype)init NS_UNAVAILABLE;

/**
 * Instantiate with components
 */
- (instancetype)initWithShareMailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML;

/**
 * Instantiate with components
 */
- (instancetype)initWithShareMailSubject:(NSString *)mailSubject mailBody:(NSString *)mailBody isHTML:(BOOL)isHTML mailRecipients:(NSArray *)mailRecipients mailCcRecipients:(NSArray *)mailCcRecipients mailBccRecipients:(NSArray *)mailBccRecipients;

@end
