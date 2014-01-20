//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Matthew Graham on 1/20/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"

@interface DetailViewController ()
{
    
    __weak IBOutlet UILabel *labelRSVP;
    __weak IBOutlet UILabel *labelHostingGroupInfo;

    __weak IBOutlet UITextView *labelDescription;
    
    __weak IBOutlet UIButton *labelLink;
}

@end

@implementation DetailViewController

@synthesize event;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = [event valueForKey:@"name"];
    labelRSVP.text = [NSString stringWithFormat:@"%@",[event valueForKey:@"yes_rsvp_count"]];
    labelDescription.text = [event valueForKey:@"description"];
    labelLink.titleLabel.text= [event valueForKey:@"event_url"];
    NSDictionary *hostingGroupDictionary = [event valueForKey:@"group"];
    labelHostingGroupInfo.text = [hostingGroupDictionary valueForKey:@"name"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
