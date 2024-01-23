//
//  ViewController.m
//  iOS_PrivateAPI
//
//  Created by zd on 19/1/2024.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "LSApplicationWorkspace.h"
#import "LSApplicationProxy.h"
#import "LSBundleProxy.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *show;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)allapplist_act:(UIButton *)sender {
    NSArray <LSApplicationProxy *> *appInfos = [[LSApplicationWorkspace defaultWorkspace] allApplications];
    for (LSApplicationProxy *appInfo in appInfos) {
        /* LSApplicationProxy.h */
        NSLog(@"applicationIdentifier : %@",appInfo.applicationIdentifier);
        NSLog(@"vendorName : %@",appInfo.vendorName);
        NSLog(@"itemName : %@",appInfo.itemName);
        NSLog(@"sdkVersion : %@",appInfo.sdkVersion);
        NSLog(@"teamID : %@",appInfo.teamID);
        NSLog(@"registeredDate : %@",appInfo.registeredDate.description);
        NSLog(@"sourceAppIdentifier : %@",appInfo.sourceAppIdentifier);
        
        /* LSBundleProxy.h */
        NSLog(@"cacheGUID : %@",[appInfo.cacheGUID UUIDString]);
        
        NSLog(@"appStoreReceiptURL : %@",appInfo.appStoreReceiptURL);
        NSLog(@"bundleContainerURL : %@",appInfo.bundleContainerURL);
        NSLog(@"bundleURL : %@",appInfo.bundleURL);
        NSLog(@"containerURL : %@",appInfo.containerURL);
        NSLog(@"dataContainerURL : %@",appInfo.dataContainerURL);
        
        NSLog(@"bundleExecutable : %@",appInfo.bundleExecutable);
        NSLog(@"bundleIdentifier : %@",appInfo.bundleIdentifier);
        NSLog(@"bundleType : %@",appInfo.bundleType);
        NSLog(@"canonicalExecutablePath : %@",appInfo.canonicalExecutablePath);
        
        NSDictionary <NSString *, NSString *> *entitlements = appInfo.entitlements;
        NSLog(@"entitlement start        ---------->");
        for (NSString *key in [entitlements allKeys]) {
            NSLog(@"%@ : %@",key, [entitlements valueForKey : key]);
        }
        NSLog(@"entitlement end          <----------");
        NSDictionary <NSString *, NSString *> *environmentVariables = appInfo.environmentVariables;
        NSLog(@"environmentVariables  start ---------->");
        for (NSString *key in [environmentVariables allKeys]) {
            NSLog(@"%@ : %@",key, [environmentVariables valueForKey : key]);
        }
        NSLog(@"environmentVariables  end   <----------");
        NSDictionary <NSString *, NSURL *> *groupContainerURLs = appInfo.groupContainerURLs;
        NSLog(@"groupContainerURLs  start   ---------->");
        for (NSString *key in [groupContainerURLs allKeys]) {
            NSLog(@"%@ : %@",key, [groupContainerURLs valueForKey : key]);
        }
        NSLog(@"groupContainerURLs  end    <----------");
        
        NSArray <NSUUID *> *machOUUIDs = appInfo.machOUUIDs;
        NSLog(@"machOUUIDs  start           ---------->");
        for (unsigned i = 0; i < machOUUIDs.count; i++) {
            NSLog(@"machOUUIDs[%d] = %@",i,[machOUUIDs[i] UUIDString]);
        }
        NSLog(@"machOUUIDs  end             <----------");
        NSString *signerIdentity = appInfo.signerIdentity;
        NSLog(@"signerIdentity : %@",signerIdentity);
        
        NSLog(@"---------------------------- end ----------------------------");
    }
}

@end
