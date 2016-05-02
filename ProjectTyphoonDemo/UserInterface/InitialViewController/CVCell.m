//
//  CVCell.m
//  StarterProjectDemo
//
//  Created by Anish on 05/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "CVCell.h"

@implementation CVCell
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
                
         self.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1.0];
        [self createLabel];
    }
    return self;
}

- (void)createLabel{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, self.frame.size.height/2 - 10, self.frame.size.width - 20, 20)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
   
    
    
}


@end
