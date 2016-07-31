//
//  ViewController.m
//  SocketClient
//
//  Created by Simple on 13-4-2.
//  Copyright (c) 2013年 simple. All rights reserved.
//

#import "ViewController.h"
#import "IMClient.h"
@interface ViewController ()
@property(nonatomic,strong)IMClient*client;
@end

@implementation ViewController

- (void)viewDidLoad
{
    _clientIPAddress.delegate=self;
    [_clientIPAddress setTag:1];
    _SendMessage.delegate=self;
    [_SendMessage setTag:2];
    _ReceiveData.editable=NO;
    [super viewDidLoad];
    
    SocketConfig *config=[[SocketConfig alloc]init];
    config.host=@"192.168.1.102";
    config.port=9090;
    
    self.client=[IMClient shareInstance];
    [self.client initialize:config serviceStatusConnectChangedBlock:^(NSInteger statusCode) {
        _Status.text=[NSString stringWithFormat:@"%ld",statusCode];
        
    } onMessageResponseBlock:^(NSString *inPacket) {
        self.ReceiveData.text=inPacket;
        
    }];
    

    
	// Do any additional setup after loading the view, typically from a nib.
}
- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    if([textField tag]==2)
    {
        [self viewUp];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    
    [textField resignFirstResponder];
    if([textField tag]==2)
    {
        [self viewDown];
    }
    return YES;
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationPortrait;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Send:(id)sender {
    if(![_SendMessage.text isEqualToString:@""])
    {
        [self.client.connect sendMsgToServer:_SendMessage.text];
        //NSString *content=[message stringByAppendingString:@"\r\n"];
        _ReceiveData.text=[NSString stringWithFormat:@"me:%@",_SendMessage.text];
    }
    else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Waring" message:@"Please input Message!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
    }
}

- (IBAction)ConnectToSever:(id)sender {
    
    [self.client.connect connect];
    
//    if(socket==nil)
//    {
//        socket=[[AsyncSocket alloc] initWithDelegate:self];
////        [socket setRunLoopModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
//        NSError *error=nil;
//        if(![socket connectToHost:_IP_ADDRESS_V4_ onPort:_SERVER_PORT_ error:&error])
//        {
//           _Status.text=@"连接服务器失败!";
//        }
//        else
//        {
//            _Status.text=@"已连接!";
//        }
//    }
//    else
//    {
//        _Status.text=@"已连接!";
//    }
}


- (void) viewUp
{
    CGRect frame=self.view.frame;
    frame.origin.y=frame.origin.y-215;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.view.frame=frame;
    [UIView commitAnimations];
}
- (void) viewDown
{
    CGRect frame=self.view.frame;
    frame.origin.y=frame.origin.y+215;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.view.frame=frame;
    [UIView commitAnimations];
}
#pragma end Delegate
- (void)dealloc {
    [_ReceiveData release];
    [_SendMessage release];
    [_Status release];
    [_clientIPAddress release];
    [super dealloc];
}

@end
