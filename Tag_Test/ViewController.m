//
//  ViewController.m
//  Tag_Test
//
//  Created by IM023 on 2015. 4. 16..
//  Copyright (c) 2015년 IM023. All rights reserved.
//

#import "ViewController.h"
#import "TLTagsControl.h"
@interface ViewController ()<UITextViewDelegate>
{
    NSMutableArray *arr_Tag;
    
    NSString *parameterStr;
    
    BOOL isShap;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isShap = NO;
parameterStr = @"";

    arr_Tag = [[NSMutableArray alloc]init];

    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
    
}




-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    //   ------ # 유무를 판별 ------
    
                NSString *fullText;
    
    if([text isEqualToString:@"#"]){
        isShap = YES;
        
        
    }
    
    if(isShap){
    
        if(![text isEqualToString:@" "] && ![text isEqualToString:@"\n"])
         

            
            parameterStr=[parameterStr stringByAppendingString:text];
     
        
        
        if([text isEqualToString:@" "] || [text isEqualToString:@"\n"]){
           
            
            
            [self detectSameString];

            [textView setSelectedRange:NSMakeRange(range.location, range.location+range.length)];
            fullText = [textView.text stringByReplacingOccurrencesOfString:@"#" withString:@""];


            [textView setText:fullText];
           
            
            
            //TextView내에서 #제거하기
            //addObject하는 부분에서도 #제거하기
            
            parameterStr = @"";
            
            isShap = NO;
        
    }
    }
    
    
    return YES;
}

-(void)detectSameString {

    parameterStr = [parameterStr stringByReplacingOccurrencesOfString:@"#" withString:@""];

    if(arr_Tag.count > 0){
        
        for(NSString *str in arr_Tag){
    
            if(![parameterStr isEqualToString:str]){
            
                [arr_Tag addObject:parameterStr];
                
                break;
            }
        }
    }
    
    else{
    
        [arr_Tag addObject:parameterStr];
    }

    self.tagScroll.tags = arr_Tag;

    self.tagScroll.tagsBackgroungColor = [UIColor whiteColor];
    self.tagScroll.tagsTextColor = [UIColor blueColor];

   
    
    
    [self.tagScroll reloadTagSubviews];
    
    NSLog(@"%@",arr_Tag);
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
