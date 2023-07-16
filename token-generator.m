#import <Foundation/Foundation.h>
#import <DeviceCheck/DeviceCheck.h>


int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];


dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    DCDevice *device = [DCDevice currentDevice];
    if ([device isSupported]) {
        [device generateTokenWithCompletionHandler:^(NSData * _Nullable token, NSError * _Nullable error) {
            if (error == nil) {
                NSString *base64Token = [token base64EncodedStringWithOptions:0];
		printf("%s", [base64Token UTF8String]);
            }
	dispatch_semaphore_signal(sema);
        }];
    } else {  
	printf("unsupported device");
	dispatch_semaphore_signal(sema);
    }

    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    [pool release];
    return 0;
}
