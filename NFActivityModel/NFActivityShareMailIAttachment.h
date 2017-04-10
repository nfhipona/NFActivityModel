//
//  NFActivityShareMailIAttachment.h
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFActivityShareMailIAttachment : NSObject

/**
 * Attachment Data
 */
@property (nonatomic, strong) NSData *attachmentData;

/**
 * Attachment's mime-type ex: 'application/pdf'
 */
@property (nonatomic, strong) NSString *attachmentDataMimeType;

/**
 * Attachment's file name ex: 'Attachment.pdf'
 */
@property (nonatomic, strong) NSString *attachmentDataFilename;

/**
 * Initialize with non-nil or empty values
 */
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithAttachmentData:(NSData *)attachmentData attachmentDataMimeType:(NSString *)attachmentDataMimeType attachmentDataFilename:(NSString *)attachmentDataFilename;


@end
