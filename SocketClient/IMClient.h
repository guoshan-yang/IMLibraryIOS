//
//  IMClient.h
//  SocketClient
//
//  Created by GCF on 16/7/7.
//  Copyright © 2016年 simple. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AsyncSocket;
@class SocketConfig;
@class IMConnect;
typedef void(^ServiceStatusConnectChangedBlock)(NSInteger statusCode);
typedef void(^OnMessageResponseBlock)(NSString * inPacket);

@interface IMClient : NSObject
@property(nonatomic,strong)IMConnect *connect;
+(instancetype) shareInstance;
-(void)initialize:(SocketConfig *)config serviceStatusConnectChangedBlock:(ServiceStatusConnectChangedBlock )serviceStatusConnectChangedBlock onMessageResponseBlock:(OnMessageResponseBlock) onMessageResponseBlock;
@end



@interface IMConnect : NSObject
@property(nonatomic,assign)BOOL serviceStatus;
@property(nonatomic,strong)AsyncSocket *socket;
@property(nonatomic,strong)SocketConfig *config;
-(void)sendMsgToServer:(NSString *)msg;
-(void)connect;
@end


@interface SocketConfig : NSObject
@property(nonatomic,copy)NSString *host;
@property(nonatomic,assign)UInt16 port;
@end
