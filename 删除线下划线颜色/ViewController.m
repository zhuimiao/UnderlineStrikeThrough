//
//  ViewController.m
//  删除线下划线颜色
//
//  Created by 141319 on 15/11/3.
//  Copyright © 2015年 com.mob.demoShareSDK. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableAttributedString+Custom.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str  = @"人秀节目。但是葛优却从来没有参加过一个真人秀节目，这是怎么回事呢?嫌酬劳不高吗?当然不是!那又是什么原因呢? 电视荧屏里火爆的真人秀节目让葛优想不明白：“怎么那么多‘铁哥们’‘好姐们’都上去当评委了?”截至目前，至少有七八档“真人秀”节目邀请葛优参加，薪酬令人咋舌，但都被他——婉拒。";
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc]initWithString:str];
    [muStr addUnderlineForSubstring:@"这是怎么回事呢?嫌酬劳不高吗?"];
    [muStr addUnderlineColor:[UIColor purpleColor]];
    
    [muStr addStrikeThrough:3 substring:@"但是葛优却从来没有参加过一个真人秀节目"];
    [muStr addStrikethroughColor:[UIColor redColor]];
    self.label.attributedText = muStr;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
