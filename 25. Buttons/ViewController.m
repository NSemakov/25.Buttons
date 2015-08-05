//
//  ViewController.m
//  25. Buttons
//
//  Created by Admin on 04.08.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isDecimalPointSet=NO;
    self.orderOfTen=1;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionNumbers:(UIButton *)sender {
    
    if (self.isSignPressed){
        self.isSignPressed=NO;
        self.bufer=[self.labelResult.text floatValue];
        self.labelResult.text=@"";
    }
    if (self.isDecimalPointSet) {
        CGFloat currentValue=[self.labelResult.text floatValue];
        CGFloat valueAfter=currentValue+sender.tag/pow(10, self.orderOfTen);
        self.orderOfTen++;
        self.labelResult.text=[NSString stringWithFormat:@"%f",valueAfter];
    } else {
        CGFloat currentValue=[self.labelResult.text floatValue];
        CGFloat valueAfter=currentValue*10+sender.tag;
        self.labelResult.text=[NSString stringWithFormat:@"%f",valueAfter];
    }
    
        
    
}

- (IBAction)actionPointButton:(UIButton *)sender {
    self.isDecimalPointSet=YES;
}

- (IBAction)actionClearResult:(UIButton *)sender {
    self.bufer=0;
    self.orderOfTen=1;
    self.isDecimalPointSet=NO;
    self.isSignPressed=NO;
    self.labelResult.text=@"0";
    self.mathSign=0;
}

- (IBAction)actionMathButton:(UIButton *)sender {
    self.isSignPressed=YES;
    self.isDecimalPointSet=NO;
    mathOperation sign=[self defineMathSignFromButton:sender];
    
    if (sign == mathOperationPlusMinus) {
        self.labelResult.text=[NSString stringWithFormat:@"%f",-[self.labelResult.text floatValue]];
    } else {
        self.mathSign=sign;
    }
}

- (IBAction)actionEqualSign:(UIButton *)sender {
        self.isSignPressed=YES;
    
        double currentValue=[self.labelResult.text doubleValue];
        double result;
        switch (self.mathSign) {
            case mathOperationPlus:
                result=self.bufer+currentValue;
                break;
            case mathOperationMinus:
                result=self.bufer-currentValue;
                break;
            case mathOperationDivide:
                result=self.bufer/currentValue;
                break;
            case mathOperationMultiple:
                result=self.bufer*currentValue;
                break;
                
            default:
                ;
                break;
        }
    //
    self.labelResult.text=[NSString stringWithFormat:@"%f",result];
    //self.bufer=currentValue;
    //self.mathSign=0;
    self.orderOfTen=1;
    self.isDecimalPointSet=NO;
    //self.isSignPressed=NO;
}

-(mathOperation) defineMathSignFromButton:(UIButton*) button {
    switch (button.tag) {
        case 10:
            return mathOperationEqual;
        case 11:
            return mathOperationPlusMinus;
        case 12:
            return mathOperationMinus;
        case 13:
            return mathOperationPlus;
        case 14:
            return mathOperationDivide;
        case 15:
            return mathOperationMultiple;
            
        default:
            return NSNotFound;
    }
}
/*
 10 =
 11 +-
 12 -
 13 +
 14 /
 15 *
 */
@end
