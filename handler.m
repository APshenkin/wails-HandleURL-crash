#include "handler.h"

@implementation GoPasser
+ (void)handleGetURLEvent:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent {
  [event paramDescriptorForKeyword:keyDirectObject];

   NSString *urlStr = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
	 // Now you can parse the URL and perform whatever action is needed
   NSLog(@"URL: %@", urlStr);

   HandleURL([[[event paramDescriptorForKeyword:keyDirectObject] stringValue] UTF8String]);
}
@end

void StartURLHandler(void) {
	NSAppleEventManager *appleEventManager = [NSAppleEventManager sharedAppleEventManager];

	[appleEventManager setEventHandler:[GoPasser class] andSelector:@selector(handleGetURLEvent:withReplyEvent:) forEventClass:kInternetEventClass andEventID: kAEGetURL];
}
