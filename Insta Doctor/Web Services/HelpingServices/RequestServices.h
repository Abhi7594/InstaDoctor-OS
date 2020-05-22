//
//  RequestServices.h
//  Kiosk
//
//  Created by Htech008 on 16/06/14.
//  Copyright (c) 2014 HTTECH. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "XMLReader.h"
@protocol RequestServicesDelegate <NSObject>
@optional
- (void)requestConnectionResultSuccess:(NSDictionary *)resultDictionary URL:(NSString *)url;
- (void)requestConnectionResultError:(NSError *)error;

@end

@interface RequestServices : NSObject

@property (nonatomic, assign) id delegate;

+ (RequestServices *)sharedInstance;
- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Delegate:(id)SELF;
- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image:( NSData*)image ImageKey:(NSString *)imageKey Delegate:(id)SELF;

- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image:( NSData*)image ImageKey:(NSString *)imageKey AVKey:(NSString *)avKey Delegate:(id)SELF;

//- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image1: (NSData *)image1 Image2: (NSData *)image2  Image3: (NSData *)image3 ImageKey1:(NSString *)imageKey1  ImageKey2:(NSString *)imageKey2 ImageKey3:(NSString *)imageKey3 Delegate:(id)SELF;

- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image1: (NSData *)image1 Image2: (NSData *)image2  Image3: (NSData *)image3  Image4: (NSData *)image4  Image5: (NSData *)image5  Image6: (NSData *)image6  Image7: (NSData *)image7  Image8: (NSData *)image8  Image9: (NSData *)image9  Image10: (NSData *)image10  ImageKey1:(NSString *)imageKey1  ImageKey2:(NSString *)imageKey2 ImageKey3:(NSString *)imageKey3 ImageKey4:(NSString *)imageKey4 ImageKey5:(NSString *)imageKey5 ImageKey6:(NSString *)imageKey6 ImageKey7:(NSString *)imageKey7 ImageKey8:(NSString *)imageKey8 ImageKey9:(NSString *)imageKey9 ImageKey10:(NSString *)imageKey10 Delegate:(id)SELF;


@end
