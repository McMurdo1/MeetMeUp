//
//  Event.h
//  MeetMeUp
//
//  Created by Matthew Graham on 1/20/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property NSString *name;
@property NSString *venue;
@property NSString *rsvpCount;
@property NSString *hostingGroup;
@property NSString *eventDescription;
@property NSURL *eventLink;

@end
