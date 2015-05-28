//
//  FriendsTableViewController.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/22/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "GCFriend.h"
#import "FriendsTableCell.h"

@interface FriendsTableViewController (){
    NSArray *userArray;
    NSMutableArray *allUsers;
}

@end

@implementation FriendsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    allUsers = [[NSMutableArray alloc]init];
    [self getUsers];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AddingFriendSel:) name:AddingFriendNotification object:nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)AddingFriendSel:(NSNotification *)notification{
    NSDictionary *tDict = [notification userInfo];
    FriendsTableCell *tCell =[tDict valueForKey:@"tableRowIndex"];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *indexRow = [f numberFromString:tCell.indexRowLabel.text];

    [allUsers[[indexRow intValue]] setIsMyFriend:YES];
    
    [[self tableView] beginUpdates];
    [[self tableView] reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:[indexRow integerValue] inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    [[self tableView] endUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [allUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UserCell";
    FriendsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.friendNameLabel.text = [allUsers[indexPath.row] Name];
    cell.friendAvatarImage.image = [allUsers[indexPath.row] avatarImage];
    cell.idLabel.text = [allUsers[indexPath.row] userID];
    [cell.idLabel setHidden:YES];
    cell.indexRowLabel.text = [NSString stringWithFormat:@"%ld" ,(long)indexPath.row];
    
    [cell.indexRowLabel setHidden:YES];
    
    if ([allUsers[indexPath.row] isMyFriend] == YES) {
        [cell.addButton setHidden:YES];
    }
    
    // Configure the cell...
    
    return cell;
}

-(void)getUsers{
    NSString *usersURLString = [NSString stringWithFormat:@"http://localhost:8000/user"];
    NSURL *usersURL = [NSURL URLWithString:usersURLString];
    NSURLRequest *usersReq = [NSURLRequest requestWithURL:usersURL];
    NSData *usersData = [NSURLConnection sendSynchronousRequest:usersReq returningResponse:nil error:nil];
    
    userArray = [[NSArray alloc]init];
    userArray = [NSJSONSerialization JSONObjectWithData:usersData options:0 error:nil];
    NSString *fileLoc = [NSString stringWithFormat:@"Users/Tim/Sites/GameCenterPoster/public"];

    for (NSDictionary *userDict in userArray) {
        //NSLog(@"%@", userDict);
        GCFriend *newFriend = [[GCFriend alloc]init];
        [newFriend setName:[userDict valueForKey:@"name"]];
        //NSLog(@"%@", [newFriend Name]);
        [newFriend setAvatarPicURL:[userDict valueForKey:@"avatarURL"]];
        [newFriend setIsMyFriend:[[userDict valueForKey:@"isMyFriend"] boolValue]];
        NSURL *temp1 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",fileLoc,[userDict objectForKey:@"avatarURL"]]];
        [newFriend setAvatarImage:[newFriend avatarImageFromURL:temp1]];
        [newFriend setUserID:[userDict valueForKey:@"_id"]];
        [allUsers addObject:newFriend];
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
