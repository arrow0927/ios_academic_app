/*This class is a delegate class and the main method delegates the job ofinstantiating
 the application views to this class
 Here the most fundamental View Controller which is the navigation View Controller
 is declared and instantiated. It controls all the other views and maintains a stack 
 where each view controller is popped on and off based on the user's selections
 
 */
#import <UIKit/UIKit.h>

@interface CFIS_TestAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> 
{
    IBOutlet UIWindow *window;
	UINavigationController *navController1;
	//UITabBarController *tabController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController1;
//@property (nonatomic, retain) IBOutlet UITabBarController *tabController;
 
@end
//===============================================================================
