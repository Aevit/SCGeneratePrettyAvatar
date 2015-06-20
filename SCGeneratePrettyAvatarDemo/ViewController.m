//
//  ViewController.m
//  SCGeneratePrettyAvatarDemo
//
//  Created by Aevit on 15/6/20.
//  Copyright (c) 2015年 Aevit. All rights reserved.
//

#import "ViewController.h"
#import "SCGeneratePrettyAvatar.h"

#define rgba(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *aLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 30)];
    aLbl.backgroundColor = [UIColor clearColor];
    aLbl.text = @"show a generated avatar with random size";
    aLbl.textAlignment = NSTextAlignmentCenter;
    aLbl.textColor = rgba(26, 188, 156, 0.6);//rgba(52, 152, 219, 0.5);
    [self.view addSubview:aLbl];
    
    UITextField *aTextField = [[UITextField alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 200) / 2, 80, 200, 40)];
    aTextField.textColor = [UIColor whiteColor];
    aTextField.textAlignment = NSTextAlignmentCenter;
    aTextField.backgroundColor = rgba(26, 188, 156, 1);
    aTextField.placeholder = @"input something";
    [aTextField becomeFirstResponder];
    [self.view addSubview:aTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(generatePrettyAvatar:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)generatePrettyAvatar:(NSNotification*)noti {
    UITextField *textField = (UITextField*)noti.object;
    static const int imageViewTag = 941213;
    UIImageView *showImgView = (UIImageView*)[self.view viewWithTag:imageViewTag];
    if (!showImgView) {
        showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(textField.frame) + 50, 0, 0)];
        showImgView.layer.masksToBounds = YES;
        showImgView.tag = imageViewTag;
        [self.view addSubview:showImgView];
    }
    CGFloat imgViewLength = arc4random() % 151 + 50;
    showImgView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - imgViewLength) / 2, CGRectGetMinY(showImgView.frame), imgViewLength, imgViewLength);
    showImgView.layer.cornerRadius = imgViewLength / 2;
    showImgView.image = [SCGeneratePrettyAvatar generateWithText:textField.text imageLength:1024];
}

@end
