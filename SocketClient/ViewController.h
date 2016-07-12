//
//  ViewController.h
//  SocketClient
//
//  Created by Simple on 13-4-2.
//  Copyright (c) 2013年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "AsyncSocket.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
//{
//    AsyncSocket *socket;
//}
@property (retain, nonatomic) IBOutlet UITextField *clientIPAddress;
@property (retain, nonatomic) IBOutlet UITextView *ReceiveData;
@property (retain, nonatomic) IBOutlet UITextField *SendMessage;
@property (retain, nonatomic) IBOutlet UILabel *Status;

- (IBAction)Send:(id)sender;
- (IBAction)ConnectToSever:(id)sender;
@end
