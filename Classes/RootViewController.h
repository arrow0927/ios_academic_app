#import <UIKit/UIKit.h>
#import "CFIS_TestAppDelegate.h"
#import "AboutViewController.h"
#import "AcademicsViewController.h"
#import "DirectoryViewController.h"
#import "NewsViewController.h"
#import "EventsViewController.h"
#import "VideosViewController.h"
#import "FoodViewController.h"
#import "HousingViewController.h"
#import "LibrariesViewController.h"
#import "GSSViewController.h"
#import "EmergencyViewController.h"
#import "CalendarTestViewController.h"
//==============================================================================
/*
The root view controller is just 1 view =  the home screen. This is the first
 view the user sees when they start the application. In other words this is the
 first view popped on to the stack by the navigation view controller


*/
//==============================================================================
@interface RootViewController : UIViewController 
{
	//Anything the user sees on the home screen must have a outlet defined here
	//Buttons on the home screen
	IBOutlet UIButton *button1, *button2,*button3,*button4,*button5,*button6,
	*button7,*button8, *button9, *button10, *button11, *button12, *button13;
	
	//Labels for those buttons
	IBOutlet UILabel *label1,*label2, *label3, *label4, *label5, *label6, 
	*label7, *label8, *label9, *label10, *label11, *label12;
	
}
//==============================================================================
//declaration for automatic setters and getters
@property (nonatomic, retain) IBOutlet UIButton *button1,*button2,*button3,
*button4,*button5,*button6,*button7,*button8, *button9, *button10, *button11, 
*button12,*button13;
//==============================================================================
//declaration for automatic setters and getters
@property (nonatomic, retain) IBOutlet UILabel *label1,*label2, *label3, 
*label4, *label5, *label6, *label7, *label8, *label9, *label10, *label11, 
*label12;

//==============================================================================
//define events
-(IBAction)buttonPressed: (id)sender;
//==============================================================================
@end
