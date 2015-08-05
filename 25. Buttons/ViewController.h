//
//  ViewController.h
//  25. Buttons
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, mathOperation){
    mathOperationPlus=1,
    mathOperationMinus,
    mathOperationPlusMinus,
    mathOperationDivide,
    mathOperationMultiple,
    mathOperationEqual
};
@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (assign,nonatomic) mathOperation mathSign;
@property (assign,nonatomic) NSInteger orderOfTen;
@property (assign,nonatomic) BOOL isDecimalPointSet;
@property (assign,nonatomic) CGFloat bufer;
@property (assign,nonatomic) BOOL isSignPressed;//+-*/=
@property (assign,nonatomic) BOOL isMathSignPressed;//+-*/
@property (assign,nonatomic) CGFloat secondBufer;


- (IBAction)actionNumbers:(UIButton *)sender;
- (IBAction)actionPointButton:(UIButton *)sender;
- (IBAction)actionClearResult:(UIButton *)sender;
- (IBAction)actionMathButton:(UIButton *)sender;
- (IBAction)actionEqualSign:(UIButton *)sender;


@end

