//
//  NFActivityShareMailIAttachment.m
//  NFActivityModel
//
//  Created by Neil Francis Hipona on 4/10/17.
//  Copyright © 2017 Neil Francis Hipona. All rights reserved.
//

#import "NFActivityShareMailIAttachment.h"

@implementation NFActivityShareMailIAttachment

- (instancetype)initWithAttachmentData:(NSData *)attachmentData attachmentDataMimeType:(NSString *)attachmentDataMimeType attachmentDataFilename:(NSString *)attachmentDataFilename {
    
    if (self = [super init]) {
        
        self.attachmentData = attachmentData;
        self.attachmentDataMimeType = attachmentDataMimeType;
        self.attachmentDataFilename = attachmentDataFilename;
    }
    
    return self;
}



@end
