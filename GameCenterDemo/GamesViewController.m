//
//  GamesViewController.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/18/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GamesViewController.h"
#import "GamesCell.h"
#import "MyGCGame.h"
@interface GamesViewController (){
    NSArray *gamesArray;
}

@end


@implementation GamesViewController
@synthesize myGames=_myGames;

-(void)viewDidLoad{
    [super viewDidLoad];
    myGames = [[NSMutableArray alloc]init];
    [self getGames];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return myGames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GamesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GamesCell" forIndexPath:indexPath];
    cell.layer.borderWidth = 0.5;
    cell.gameNameLabel.text = [myGames[indexPath.row] Name];
    cell.gameDevLabel.text = [myGames[indexPath.row] dev];
    cell.gameIconImage.image = (UIImage*)[myGames[indexPath.row] gameIconImage];
    cell.gameIconImage.layer.borderWidth = 0.5;
    cell.gameIconImage.layer.cornerRadius = roundf(cell.gameIconImage.frame.size.width/8.0);
    cell.gameIconImage.layer.masksToBounds = YES;
    
    NSData *imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"trophy" ofType:@"png"]];
    cell.trophyImage.image =[UIImage imageWithData:imageData];
    
    cell.achievementsLabel.text = [NSString stringWithFormat:@"%@ / %@",[myGames[indexPath.row] currAchievments], [myGames[indexPath.row] maxAchievments]];
    
    cell.currentPointsLabel.text = [NSString stringWithFormat:@"%@ Points",[[myGames[indexPath.row] currPoints] stringValue]];
    
    return cell;
}

-(void)getGames{
    NSString * gamesURLString = [NSString stringWithFormat:@"http://localhost:8000/games"];
    NSURL *gamesURL = [NSURL URLWithString:gamesURLString];
    NSURLRequest *gamesReq = [NSURLRequest requestWithURL:gamesURL];
    
    NSData *gameData = [NSURLConnection sendSynchronousRequest:gamesReq returningResponse:nil error:nil];
    gamesArray = [[NSArray alloc]init];
    gamesArray = [NSJSONSerialization JSONObjectWithData:gameData options:0 error:nil];
    NSString *fileLoc = [NSString stringWithFormat:@"Users/Tim/Sites/GameCenterPoster/public"];
    
    for (NSDictionary *game in gamesArray) {
        MyGCGame *newGame = [[MyGCGame alloc]init];
        [newGame setName:[game valueForKey:@"name"]];
        [newGame setGameIconURL:[NSURL URLWithString:[game valueForKey:@"iconURL"]]];
        [newGame setDev:[game valueForKey:@"dev"]];
        
        [newGame setCurrPoints:[NSNumber numberWithInt:[[game valueForKey:@"currPoints"] intValue]]];
        [newGame setMaxPoints:[NSNumber numberWithInt:[[game valueForKey:@"maxPoints"] intValue]]];
        [newGame setCurrAchievments:[NSNumber numberWithInt:[[game valueForKey:@"currAch"] intValue]]];
        [newGame setMaxAchievments:[NSNumber numberWithInt:[[game valueForKey:@"maxAch"] intValue]]];
        
        NSDateFormatter *formater = [[NSDateFormatter alloc ]init];
        [formater setDateFormat:@"YYYY-mm-dd HH:mm:ss"];
        [newGame setGameDate:[formater dateFromString:[game valueForKey:@"date"]]];
        //NSLog(@"%@", [newGame gameDate]);
        
        NSURL *temp1 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",fileLoc,[game objectForKey:@"iconURL"]]];
        [newGame setGameIconImage:[newGame gameIconImageFromURL:temp1]];
       // NSLog(@"%@", [newGame description]);
        [myGames addObject:newGame];
    }

}

@end
