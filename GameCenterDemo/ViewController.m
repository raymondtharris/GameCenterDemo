//
//  ViewController.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "ViewController.h"
#import "GCPostCell.h"
#import "GCPost.h"

@interface ViewController (){
    NSArray* postsArray;
    NSOperationQueue *networkQueue;
    NSMutableArray *userPosts;
}

@end

@implementation ViewController
@synthesize userPosts =_userPosts;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    userPosts = [[NSMutableArray alloc]init];
    [self getPosts];
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return userPosts.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GCPostCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GCPostCell" forIndexPath:indexPath];
    cell.layer.borderWidth = 0.5;
    
    //NSLog(@"%@",[[userPosts[indexPath.row] game] Name]);
    cell.userNameLabel.text = [[userPosts[indexPath.row] gUser] Name];
    cell.userPointsCountLabel.text = [NSString stringWithFormat:@"%@ Points",[[[userPosts[indexPath.row]gUser]pointsCount] stringValue]];
    
    cell.userAvatarImage.image = [[userPosts[indexPath.row] gUser] avatarImage];
    cell.userAvatarImage.layer.cornerRadius = roundf(cell.userAvatarImage.frame.size.width/2.0);
    cell.userAvatarImage.layer.masksToBounds=YES;
    cell.userAvatarImage.layer.borderWidth = 1.0;
    
    cell.postMessageLabel.text = [userPosts[indexPath.row]postMessage];
    [cell.postMessageLabel setNumberOfLines:0];
    [cell.postMessageLabel layoutIfNeeded];
    [cell.postMessageLabel sizeToFit];
    
    if ([userPosts[indexPath.row] postDate] == nil) {
        cell.timeLabel.text = @"";
    }
    else{
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        [format setDateFormat:@"HH:mm"];
        cell.timeLabel.text = [format stringFromDate:[userPosts[indexPath.row]postDate]];
        //cell.timeLabel.text = [NSString stringWithFormat:@"%@",[userPosts[indexPath.row] postDate]];
    }
    cell.gameNameLabel.text = [[userPosts[indexPath.row] gGame] Name];
    cell.gameIconImage.image = [[userPosts[indexPath.row]gGame] gameIconImage];
    cell.gameIconImage.layer.cornerRadius = roundf(cell.gameIconImage.frame.size.width/8.0);
    cell.gameIconImage.layer.masksToBounds = YES;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getPosts{
    NSString *postsURLString = @"http://localhost:8000/posts";
    NSURL * postsURL = [NSURL URLWithString:postsURLString];
    NSURLRequest *getPostsRequest =[NSURLRequest requestWithURL:postsURL];
    NSData *postsData = [NSURLConnection sendSynchronousRequest:getPostsRequest returningResponse:nil error:nil];
    postsArray =[[NSArray alloc]init];
    postsArray = [NSJSONSerialization JSONObjectWithData:postsData options:0 error:nil];
    
    NSString *fileLoc = [NSString stringWithFormat:@"Users/Tim/Sites/GameCenterPoster/public"];
    for (NSDictionary *post in postsArray) {
        
        //Creating objects for GCPost data structure
        GCPost *newPost = [[GCPost alloc]init];
        GCGame *newGame = [[GCGame alloc]init];
        GCUser *newUser = [[GCUser alloc]init];
        
        //Setting Message Post
        [newPost setPostMessage:[post objectForKey:@"postMessage"]];
        
        // Creating Dictionaries to access game and user data
        NSDictionary *gameDict = [[NSDictionary alloc]initWithDictionary:[post objectForKey:@"game"]];
        NSDictionary *userDict = [[NSDictionary alloc]initWithDictionary:[post objectForKey:@"user"]];
        
        [newGame setName:[gameDict objectForKey:@"name"]];
        [newGame setGameIconURL:[NSURL URLWithString:[gameDict objectForKey:@"iconURL"]]];
        
        [newUser setName:[userDict objectForKey:@"name"]];
        [newUser setPointsCount:[NSNumber numberWithLongLong:[[userDict objectForKey:@"pointsCount"] longLongValue]]];
        [newUser setAvatarPicURL:[NSURL URLWithString:[userDict objectForKey:@"avatarURL"]]];
        
        NSURL *temp1 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",fileLoc,[userDict objectForKey:@"avatarURL"]]];
        NSURL *temp2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",fileLoc,[gameDict objectForKey:@"iconURL"]]];

        if([post objectForKey:@"date"] != nil){
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"YYYY-mm-dd HH:mm:ss"];
            [newPost setPostDate:[formatter dateFromString:[post valueForKey:@"date"]]];
            //NSLog(@"%@", [newPost postDate]);
        }
        
        
        [newUser setAvatarImage:[newUser avatarImageFromURL:temp1]];
        [newGame setGameIconImage:[newGame gameIconImageFromURL:temp2]];
        [newPost setGGame:newGame];
        [newPost setGUser:newUser];
         //NSLog(@"%@",[newPost description]);
        [userPosts addObject:newPost];
        
    }
    
}

@end
