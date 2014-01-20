//
//  ViewController.m
//  MeetMeUp
//
//  Created by Matthew Graham on 1/20/14.
//  Copyright (c) 2014 Matthew Graham. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *meetUpEventsDictionary;
    NSMutableArray *meetUpEventsArray;
    NSMutableArray *eventObjectsArray;
    Event *event;
    __weak IBOutlet UITableView *meetUpTableView;
}

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	NSURL *meetUpURL = [NSURL URLWithString:(@"https://api.meetup.com/2/open_events.json?zip=60604&text=mobile&time=,1w&key=6d797485e4e67406f7a524f5d3d297a")];
    NSURLRequest *meetUpURLRequest = [NSURLRequest requestWithURL:meetUpURL];
    
    [NSURLConnection sendAsynchronousRequest:meetUpURLRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        
        meetUpEventsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        meetUpEventsArray = [meetUpEventsDictionary valueForKey:@"results"];
        
        
        [meetUpTableView reloadData];
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return meetUpEventsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *eventCell = [tableView dequeueReusableCellWithIdentifier:@"meetUpCell"];
    NSDictionary *eventDictionary = [meetUpEventsArray objectAtIndex:indexPath.row];
    NSDictionary *locationDictionary = [eventDictionary valueForKey:@"venue"];
    
    
    eventCell.textLabel.text = [eventDictionary objectForKey:@"name"];
    eventCell.detailTextLabel.text = [locationDictionary objectForKey:@"address_1"];
    return eventCell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [meetUpTableView indexPathForCell:sender];
    vc.event = [meetUpEventsArray objectAtIndex:indexPath.row];
    NSLog(@"%@", vc.event);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
