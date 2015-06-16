//
//  ViewController.h
//  Tag_Test
//
//  Created by IM023 on 2015. 4. 16..
//  Copyright (c) 2015년 IM023. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLTagsControl.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tagtext;

@property (weak, nonatomic) IBOutlet TLTagsControl *tagScroll;

@end

