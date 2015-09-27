//
//  ViewController.m
//  CloseKeyboardButton
//
//  Created by 3BR-T on 2015/09/09.
//  Copyright (c) 2015年 3BR-T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>{
    IBOutlet UITextField *inputTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    inputTextField.delegate = self;
    
    // キーボードに閉じるボタンを追加する
    [self makeCloseButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeCloseButton{
    // 閉じるボタンを配置するUIViewを作成する
    // ビューの大きさは、画面の横幅と同じで高さは44にする
    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = 44;
    CGRect viewRect = CGRectMake(0, 0, viewWidth, viewHeight);
    UIView *buttonView = [[UIView alloc] initWithFrame:viewRect];
    // ビューの背景色を設定する
    buttonView.backgroundColor = [UIColor colorWithWhite:0.5f alpha:0.5f];
    
    // 閉じるボタンを作成する
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // ボタンの大きさは、横幅が60で高さは30にする
    CGFloat buttonWidth = 60;
    CGFloat buttonHeight = 30;
    CGRect buttonRect = CGRectMake(0, 0, buttonWidth, buttonHeight);
    closeButton.bounds = buttonRect;
    // ボタンのx座標は画面の右端からマージンを引いた位置、y座標はボタンビューの真ん中にする
    CGFloat buttonMargin = 10;
    CGFloat buttonCenterX = self.view.bounds.size.width - buttonMargin - buttonWidth / 2;
    CGFloat buttonCenterY = buttonView.bounds.size.height / 2;
    CGPoint buttonCenter = CGPointMake(buttonCenterX, buttonCenterY);
    closeButton.center = buttonCenter;
    // ボタンのタイトルを『Close』にする
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    
    // 閉じるボタンを押したときに呼ばれる動作を設定する
    [closeButton addTarget:self action:@selector(closeKeyboard:) forControlEvents:UIControlEventTouchUpInside];
    
    // 閉じるボタンをViewに追加する
    [buttonView addSubview:closeButton];
    
    // 閉じるボタンつきのViewをUITextFieldのinputAccessoryViewに設定する
    inputTextField.inputAccessoryView = buttonView;
}

// キーボードを閉じる
-(void)closeKeyboard:(id)sender{
    [inputTextField resignFirstResponder];
}

// リターンキーを押したときにキーボードを閉じる
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
