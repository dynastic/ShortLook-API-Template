#import "RENAMETHISContactPhotoProvider.h"

@implementation RENAMETHISContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(NSObject<DDNotificationDisplayable> *)notification {
    UIImage *image = [UIImage imageWithContentsOfFile:@"/var/mobile/Library/Application Support/Dynastic/ShortLook/icon.png"];
    // There are two ways to return an image. Asynchronously (if it might take a while) and synchronously (instant).
    // Read the docs for more information.

    // Asynchronous method:
    DDNotificationContactPhotoPromiseOffer *offer = [[NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") alloc] initWithPhotoIdentifier:@"fantastic-unique-identifier"];
    [offer fulfillWithBlock:^(DDNotificationContactPhotoPromise *promise) {
        promise.backgroundColor = [UIColor yellowColor]; // you can optionally provide a background colour in the case of partially transparent images

        [NSThread sleepForTimeInterval:0.5]; // wait half a second to simulate server call
        [promise resolveWithImage:image];
        // if failed? -> [promise reject];
    }];
    return offer;

    // Synchronous method:
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerInstantlyResolvingPromiseWithPhotoIdentifier:@"super-unique-identifier" image:image];
}

@end