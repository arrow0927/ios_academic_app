/*
 This class is a delegate class for the application
 Each Application can only have 1 instance of UIApplication
 The AppDelegate class is a class that the UIApplication class delegates chores to 
 do on behalf of it
 
 
*/
#import "CFIS_TestAppDelegate.h"
#import "RootViewController.h"

@implementation CFIS_TestAppDelegate
@synthesize window;
@synthesize navController1;
//@synthesize tabController;

//==============================================================================
- (void)applicationDidFinishLaunching:(UIApplication *)application 
{    
    navController1 = [[UINavigationController alloc] init];

	UIViewController *rootViewController = [[RootViewController alloc]
											initWithNibName:@"RootViewController"
											bundle:[NSBundle mainBundle]];
	[navController1 pushViewController:rootViewController
							  animated:NO];
	
	//[window addSubview:tabController.view];
	[window addSubview: navController1.view];
    [window makeKeyAndVisible];
}
//==============================================================================
- (void)dealloc 
{
	//[tabController release];
	[navController1 release];
	[RootViewController release];
    [window release];
    [super dealloc];
}
//==============================================================================

@end
