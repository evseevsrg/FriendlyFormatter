//
//  NSDate+FriendlyFormatter.h
//  FriendlyFormatter
//
//  Created by Sergey Evseev on 03/02/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FriendlyFormatter)

- (NSString *)friendlyFormat;
- (BOOL)prefers24Hour;

@end
