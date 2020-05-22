//
//  RequestServices.m
//  Kiosk
//
//  Created by Monu Rathor on 16/06/14.
//  Copyright (c) 2014 HT. All rights reserved.
//

#import "RequestServices.h"
//#import "Common.h"
@interface RequestServices ()

@property (nonatomic, retain) NSOperationQueue *queue;

@end

@implementation RequestServices
@synthesize delegate;

/*
 *  Singleton instamnce method.
 *
 */

#pragma mark - Web services methods.
/*
 *  Method to use create new user (Registration).
 */

#pragma mark - Request connection methods.
/*!
 *  Method to use create new connection for post request with passing arguments dictionary without image.
 *  @param method is the service name, dictionary is the service arguments for responce.
 */
- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Delegate:(id)SELF{
    self.delegate = SELF;
    //-- Make request url
    
    
    NSURL *url = [NSURL URLWithString:method];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    if (!self.queue) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    [NSURLConnection sendAsynchronousRequest:request queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(!error){
            [self requestConnectionResultSuccess:data URL: method];
        }else{
            [self requestConnectionResultError:error];
        }
    }];
    

}




/*
 *  Method to use create new connection for post request with passing arguments dictionary with image.
 *  @param method is the service name, dictionary is the service arguments for responce.
 */

- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image:(NSData *)image ImageKey:(NSString *)imageKey AVKey:(NSString *)avKey Delegate:(id)SELF {
    self.delegate = SELF;
    //-- Make request url
    NSURL *requestURL = [NSURL URLWithString:method];
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    NSLog(@"%@", postRequest);
    //-- Add multipart/form-data arguments for request.
    NSString *stringBoundary =@"Pp3-tEX4Vj-1nmcx6Op8-L0IgAeN4agBX";
    NSMutableData *postBody = [NSMutableData data];
    NSString *headerBoundary = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",stringBoundary];
    [postRequest addValue:headerBoundary forHTTPHeaderField:@"Content-Type"];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postString = @"";
    
    //-- Set all arguments with request.
    for( NSString *aKey in [dictionary allKeys] ){
        postString=[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",aKey];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"%@",[dictionary valueForKey:aKey]];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //-- Add User Image to post url
    
    if (image!=nil) {
        if ([avKey isEqualToString:@".m4a"]) {
            [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"newsFiles.m4a\"\r\n",imageKey] dataUsingEncoding:NSUTF8StringEncoding]];
        }
        else {
            [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"newsFiles.mp4\"\r\n",imageKey] dataUsingEncoding:NSUTF8StringEncoding]];

        }
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    //-- Setting Connection
    postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
    [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postRequest setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [postRequest setHTTPMethod:@"POST"];
    //    [postRequest setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postBody length]];
    [postRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [postRequest setHTTPBody:postBody];
    
    //-- Make connection.
    [self requestConnection:postRequest URL:method];
}
- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image: (NSData *)image ImageKey:(NSString *)imageKey Delegate:(id)SELF{
    self.delegate = SELF;
    //-- Make request url
   NSURL *requestURL = [NSURL URLWithString:method];
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    NSLog(@"%@", postRequest);
    
    NSString *email = [[NSUserDefaults standardUserDefaults] valueForKey:@"BF_EMAIL"];
    NSString *pass = [[NSUserDefaults standardUserDefaults] valueForKey:@"BF_PASSWORD"];
    NSString *SDAS = [email stringByAppendingString:@":"];
    NSString *authTokenString = [SDAS stringByAppendingString:pass];
    NSData *plainData = [authTokenString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0]; NSLog(@"%@", base64String);
    [postRequest setValue:base64String forHTTPHeaderField:@"App-Token"];
    [postRequest setHTTPMethod:@"POST"];

    //-- Add multipart/form-data arguments for request.
    NSString *stringBoundary =@"Pp3-tEX4Vj-1nmcx6Op8-L0IgAeN4agBX";
    NSMutableData *postBody = [NSMutableData data];
    NSString *headerBoundary = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",stringBoundary];
    [postRequest addValue:headerBoundary forHTTPHeaderField:@"Content-Type"];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postString = @"";

    //-- Set all arguments with request.
    for( NSString *aKey in [dictionary allKeys] ){
        postString=[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",aKey];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"%@",[dictionary valueForKey:aKey]];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //-- Add User Image to post url
    
    if (image!=nil) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@.jpg", imageKey]);
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",imageKey, [NSString stringWithFormat:@"%@.jpg", imageKey]] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];

    }

    //-- Setting Connection
    postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
    [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];

    [postRequest setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [postRequest setHTTPMethod:@"POST"];
//    [postRequest setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postBody length]];
    [postRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [postRequest setHTTPBody:postBody];

    //-- Make connection.
    [self requestConnection:postRequest URL:method];
}



- (void)createRequestMethod:(NSString *)method Dictionary:(NSDictionary *)dictionary Image1: (NSData *)image1 Image2: (NSData *)image2  Image3: (NSData *)image3  Image4: (NSData *)image4  Image5: (NSData *)image5  Image6: (NSData *)image6  Image7: (NSData *)image7  Image8: (NSData *)image8  Image9: (NSData *)image9  Image10: (NSData *)image10  ImageKey1:(NSString *)imageKey1  ImageKey2:(NSString *)imageKey2 ImageKey3:(NSString *)imageKey3 ImageKey4:(NSString *)imageKey4 ImageKey5:(NSString *)imageKey5 ImageKey6:(NSString *)imageKey6 ImageKey7:(NSString *)imageKey7 ImageKey8:(NSString *)imageKey8 ImageKey9:(NSString *)imageKey9 ImageKey10:(NSString *)imageKey10 Delegate:(id)SELF{
    self.delegate = SELF;
    //-- Make request url
    NSURL *requestURL = [NSURL URLWithString:method];
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:requestURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    //-- Add multipart/form-data arguments for request.
    NSString *stringBoundary =@"Pp3-tEX4Vj-1nmcx6Op8-L0IgAeN4agBX";
    NSMutableData *postBody = [NSMutableData data];
    NSString *headerBoundary = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",stringBoundary];
    [postRequest addValue:headerBoundary forHTTPHeaderField:@"Content-Type"];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    NSString *postString = @"";
    
    //-- Set all arguments with request.
    for( NSString *aKey in [dictionary allKeys] ){
        postString=[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",aKey];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"%@",[dictionary valueForKey:aKey]];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    //-- Add User Image  to post url
    
    if (image1!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey1] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image1];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    if (image2!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey2] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image2];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    if (image3!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey3] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image3];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    if (image4!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey4] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image4];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image5!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey5] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image5];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image6!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey6] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image6];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image7!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey7] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image7];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image8!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey8] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image8];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image9!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey9] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image9];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    if (image10!=nil) {
        [postBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"photoUpload.jpg\"\r\n",imageKey10] dataUsingEncoding:NSUTF8StringEncoding]];
        postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        [postBody appendData:image10];
        [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
    }

    //-- Setting Connection
    postString=[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
    [postBody appendData:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [postRequest setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postBody length]];
    [postRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [postRequest setHTTPBody:postBody];
    
    //-- Make connection.
    [self requestConnection:postRequest URL:method];
}

/*
 *  Method to use make new connection for request.
 *  @param NSData for responce.
 */
- (void)requestConnection:(NSURLRequest *)urlRequest URL:(NSString *)url {
    if (!self.queue) {
        self.queue = [[NSOperationQueue alloc] init];
    }
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:self.queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(!error){
            [self requestConnectionResultSuccess:data  URL:url];
        }else{
            [self requestConnectionResultError:error];
        }
    }];
}

#pragma mark - Request results methods
/*
 *  Method to use for result success.
 *  @param NSData for responce.
 */
- (void)requestConnectionResultSuccess:(NSData *)resultData URL: (NSString *)url {
    NSError *error = nil;
    NSString* newStr = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"NSSSSSSS=%@",newStr);
    NSData *data = [newStr dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if ([url containsString:@"special/offer"]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForCreateNewOffer" object:self userInfo:json];
        });
    }
//    else if ([url containsString:@"api/sendOneToOneMsg"]) {
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForSentMessage" object:self userInfo:json];
//        });
//    }
//    else if ([url containsString:@"api/updateUserProfilePicture"]) {
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForEditImage" object:self userInfo:json];
//        });
//    }
    
    NSLog(@"NSSSSSSS=%@",json);
//    if ([[json objectForKey:@"type"]  isEqual: @"news"]) {
//
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//            //Background Thread
//            dispatch_async(dispatch_get_main_queue(), ^(void){
//
//            });
//        });
//    }
//    else if ([[json objectForKey:@"responseCode"]  isEqual: @"0"]) {
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//            //Background Thread
//            dispatch_async(dispatch_get_main_queue(), ^(void){
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForNewsFeed" object:self userInfo:json];
//
//            });
//        });
//
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//            //Background Thread
//            dispatch_async(dispatch_get_main_queue(), ^(void){
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForNotices" object:self userInfo:json];
//            });
//        });
//    }
//    else {
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
//            //Background Thread
//            dispatch_async(dispatch_get_main_queue(), ^(void){
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"ResponseForNotices" object:self userInfo:json];
//            });
//        });
//    }

//    NSDictionary *parseDictionary=[XMLReader dictionaryForXMLData:resultData error:nil];
//    NSLog(@"dict=%@",parseDictionary);
//    if (parseDictionary!=nil) {
//        if ([self.delegate respondsToSelector:@selector(requestConnectionResultSuccess:)]) {
//            [self.delegate performSelectorOnMainThread:@selector(requestConnectionResultSuccess:) withObject:parseDictionary waitUntilDone:NO];
//        }
//    }
//    else{
//        if ([self.delegate respondsToSelector:@selector(requestConnectionResultError:)]) {
//            [self.delegate performSelectorOnMainThread:@selector(requestConnectionResultError:) withObject:error waitUntilDone:NO];
//        }
//    }
}

/*
 *  Method to use for result failed/error.
 *  @param NSError for error responce.
 */
- (void)requestConnectionResultError:(NSError *)error{
    if ([self.delegate respondsToSelector:@selector(requestConnectionResultError:)]) {
        [self.delegate performSelectorOnMainThread:@selector(requestConnectionResultError:) withObject:error waitUntilDone:NO];
    }
}
+ (RequestServices *)sharedInstance
{
    static RequestServices *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[RequestServices alloc] init];
        
        return sharedSingleton;
    }
}


@end
