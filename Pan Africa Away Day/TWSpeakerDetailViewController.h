//
//  TWSpeakerDetailViewController.h
//  Away Day 2014
//
//  Created by James Muranga on 2/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Speaker.h"

@interface TWSpeakerDetailViewController : UIViewController
@property (strong, nonatomic)  Speaker *speaker;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@end
