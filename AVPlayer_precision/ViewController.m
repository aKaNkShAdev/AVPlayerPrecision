//
//  ViewController.m
//  AVPlayer_precision
//
//  Created by Akanksha Sharma on 24/10/16.
//  Copyright © 2016 akanksha. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){
    int frameCount;

}
@property (weak, nonatomic) IBOutlet UISlider *playerSlider;


@end

@implementation ViewController
AVPlayer *myPlayer;
AVAsset *myasset;

- (void)viewDidLoad {
    [super viewDidLoad];
    frameCount = 0;
     myPlayer = [[AVPlayer alloc] initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"]]];
    myasset = [AVAsset assetWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"]]];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:myPlayer];
    playerLayer.frame = CGRectMake(0, 0, 375, 261);
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.playerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.playerView.layer addSublayer:playerLayer];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender {
    NSLog(@"slider value changed %lld",CMTimeMake(_playerSlider.value * CMTimeGetSeconds(myasset.duration), 1).value);
    [myPlayer seekToTime:CMTimeMake(_playerSlider.value * CMTimeGetSeconds(myasset.duration), 10) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];
    //[myPlayer seekToTime:CMTimeMake(_playerSlider.value * CMTimeGetSeconds(myasset.duration), 3)];

}

- (IBAction)btnNextClicked:(id)sender {
    frameCount = frameCount + 5;
    NSLog(@"time value %lld and frame count %i", CMTimeMake(frameCount, 30).value,frameCount);
    //[myPlayer seekToTime:CMTimeMake(frameCount, 30)];
   [myPlayer seekToTime:CMTimeMake(frameCount, 30) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];

}

- (IBAction)btnPreviousClicked:(id)sender {
    frameCount = frameCount - 5;
        NSLog(@"time value %lld and frame count %i", CMTimeMake(frameCount, 30).value,frameCount);
    //[myPlayer seekToTime:CMTimeMake(frameCount, 30)];
    [myPlayer seekToTime:CMTimeMake(frameCount, 30) toleranceBefore:kCMTimeZero toleranceAfter:kCMTimeZero];

}
@end
