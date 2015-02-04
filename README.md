# FriendlyFormatter

Format NSDate in Apple-style.

Today: 3:23 PM
Today (+4 minutes): 3:27 PM
Yesterday: Yesterday
A day ago: Monday
Two days ago: Sunday


## Example Usage

Import category header
``` objective-c
#import "NSDate+FriendlyFormatter.h"
```

Format NSDate
``` objective-c
    NSDate *todayDate = [[NSDate alloc] init];
    NSLog(@"Today: %@", [todayDate friendlyFormat]);
```