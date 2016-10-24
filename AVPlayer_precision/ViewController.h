//
//  ViewController.h
//  AVPlayer_precision
//
//  Created by Akanksha Sharma on 24/10/16.
//  Copyright © 2016 akanksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
- (IBAction)btnNextClicked:(id)sender;
- (IBAction)btnPreviousClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *playerView;

@end

