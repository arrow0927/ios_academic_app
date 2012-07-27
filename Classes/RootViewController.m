#import "RootViewController.h"
@implementation RootViewController

//auto implement setters and getters
@synthesize button1, button2, button3, button4, button5, button6, button7, 
button8, button9, button10, button11, button12, button13;
//auto implement setters and getters
@synthesize label1, label2, label3, label4, label5, label6, label7, label8, 
label9, label10, label11, label12; 

//==============================================================================
//Methods
//define what happens when a button is pressed
-(IBAction)buttonPressed: (id)sender
{
	switch([sender tag]) //Each button has a tag number entered in the .xib file
   {
	   case 1://if the button has a tag # 1
	  {
		  NSLog (@"Button 1 <About> Pressed");
		  //
		  //[label1  setBackgroundColor: [UIColor grayColor]];
		  //?? How to undo the background color after button is released?
		  
		  UIViewController *aboutViewController = [[AboutViewController alloc]
												   initWithNibName:@"AboutViewController"
												   bundle:nil];
		  
		 [self.navigationController pushViewController:aboutViewController
									animated:YES];
		
		  [aboutViewController release];
	  }
		   break;
	   case 2:
	  {
		  NSLog (@"Button 2 <Academics> Pressed");
		  //[label2 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  UIViewController *academicsViewController = [[AcademicsViewController alloc]
												   initWithNibName:@"AcademicsViewController"
												   bundle:nil];
		  
		  [self.navigationController pushViewController:academicsViewController
		   animated:YES];
		  [academicsViewController release];
		  
	  }
		   break;
	   case 3:
	  {
		  NSLog (@"Button 3 <Research> Pressed");
		[label3 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  /*
		   TO BE IMPLEMENTED:
		   -Instantiate a sectioned Table View Controller that displays all the 
		   -research units, sections will be grouped by faculty
		   -Each row will contain a disclosure indicator that will lead to a detailed
		   -view of each row
		   -The detailed view will have a button that leads to the website of the
		   -research unit and to the mapped location of the research unit, also a button to the 
		   -key contacts and advisors for the research unit
		   */
		  
		  /*UIViewController *researchViewController = [[ResearchViewController alloc]
													   initWithNibName:@"ResearchViewController"
													   bundle:nil];
		  
		  [self.navigationController pushViewController:researchViewController
		   animated:YES];
		  [researchViewController release];
		*/
	  }
		   break;
	   case 4:
	  {
		  NSLog (@"Button 4 <Directory> Pressed");
		[label4 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  /*
		   TO BE IMPLEMENTED:
		   -Instantiate a indexed Table View Controller that displays all the 
		   -contacts alphabetically, implement a index, plist will be downloaded by user at will
		   -from a server and can be refreshed by administrator
		   -Each row will contain a disclosure indicator that will lead to a detailed
		   -view of each person
		   -The detailed view will have a button that leads to the website of the
		   -person and to the mapped location of his/her office
		   -also the ability to call him/her
		   */
		  UIViewController *directoryViewController = [[DirectoryViewController alloc]
													  initWithNibName:@"DirectoryViewController"
													  bundle:nil];
		  
		  [self.navigationController pushViewController:directoryViewController
		   animated:YES];
		  [directoryViewController release];
	  }
		   break;
	   case 5:
	  {
		  NSLog (@"Button 5 <News> Pressed");
		[label5 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  /*
		   TO BE IMPLEMENTED:
		   -Instantiate a sectioned Table View Controller that displays a news feed 
		   -section 1: messages/alerts/announcements from CFIS
		   -section 2: news
		   -news will be downloaded by user at will
		   -from a server and can be refreshed by administrator
		   -Each row will contain a disclosure indicator that will lead to a detailed
		   -view of each person
		   -The detailed view will have a button that leads to the website for more
		   -info
		   */
		  
		  UIViewController *newsViewController = [[NewsViewController alloc]
													   initWithNibName:@"NewsViewController"
													   bundle:nil];
		  
		  [self.navigationController pushViewController:newsViewController
		   animated:YES];
		  [newsViewController release];
	  }
		   break;
	   case 6:
	  {
		  NSLog (@"Button 6 <Events> Pressed");
		[label6 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  /*
		   TO BE IMPLEMENTED:
		   -Events default display will be a feed by the date
		   -User will be able to get events by location for a particular date 
		   -using a map view
		   */
		  CalendarTestViewController *calendarTestViewController =
		  [[CalendarTestViewController alloc] initWithNibName: @"CalendarTestViewController" bundle:nil];
		  //This initiates the events controller object which displays the calendar
																												
		  
		  
		  
		  [self.navigationController pushViewController:calendarTestViewController
		   animated:YES];
		  [CalendarTestViewController release];
	  }
		   break;
	   case 7:
	  {
		  NSLog (@"Button 7 <Videos> Pressed");
		[label7 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  /*
		   TO BE IMPLEMENTED:
		   -instantiate a sectioned table view controller that accesses You tube
		   -videos of CFIS
		   */
		  UIViewController *videosViewController = [[VideosViewController alloc]
													initWithNibName:@"VideosViewController"
													bundle:nil];
		  
		  [self.navigationController pushViewController:videosViewController
		   animated:YES];
		  [videosViewController release];
		  
	  }
		   break;
	   case 8:
	  {
		  NSLog (@"Button 8 <Food> Pressed");
		[label8 setBackgroundColor: [UIColor blueColor]];
		  //?? How to undo the background color after button is released?
		  UIViewController *foodViewController = [[FoodViewController alloc]
													initWithNibName:@"FoodViewController"
													bundle:nil];
		  
		  [self.navigationController pushViewController:foodViewController
		   animated:YES];
		  [foodViewController release];
	  }
		   break;
	   case 9:
	  {
		  NSLog (@"Button 9 <Housing> Pressed");
		  //TO BE IMPLEMENTED
		  UIViewController *housingViewController = [[HousingViewController alloc]
												  initWithNibName:@"HousingViewController"
												  bundle:nil];
		  
		  [self.navigationController pushViewController:housingViewController
		   animated:YES];
		  [housingViewController release];
	  }
		   break;
	   case 10:
	  {
		  NSLog (@"Button 10 <Libraries> Pressed");
		  //TO BE IMPLEMENTED
		  UIViewController *librariesViewController = [[LibrariesViewController alloc]
												  initWithNibName:@"LibrariesViewController"
												  bundle:nil];
		  
		  [self.navigationController pushViewController:librariesViewController
		   animated:YES];
		  [librariesViewController release];
	  }
		   break;
	   case 11:
	  {
		  NSLog (@"Button 11 <GSS> Pressed");
		  //TO BE IMPLEMENTED
		  UIViewController *gssViewController = [[GSSViewController alloc]
												  initWithNibName:@"GSSViewController"
												  bundle:nil];
		  
		  [self.navigationController pushViewController:gssViewController
		   animated:YES];
		  [gssViewController release];
	  }
		   break;
	   case 12:
	  {
		  NSLog (@"Button 12 <Emergency> Pressed");
		  //TO BE IMPLEMENTED
		  UIViewController *emergencyViewController = [[EmergencyViewController alloc]
												  initWithNibName:@"EmergencyViewController"
												  bundle:nil];
		  
		  [self.navigationController pushViewController:emergencyViewController
		   animated:YES];
		  [emergencyViewController release];
	  }
		   break;
	   case 13:
	  {
		  NSLog (@"Button 13 <UpdateAll> Pressed");
		  //TO BE IMPLEMENTED
		  /*
		   Update all databases on device
		   */
	  }
		   break;
		   
		   
   }
	
}
//==============================================================================
/*
 // The designated initializer.  Override if you create the controller programmatically 
 //and want to perform customization that is not appropriate for viewDidLoad.
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
 {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) 
 {
        // Custom initialization
    }
    return self;
}
*/
//==============================================================================
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	self.title = @"UBC";
	label1.text = @"*About";
	label2.text = @"*Academics";
	label3.text = @"*Research";
	label4.text = @"*Directory";
	label5.text = @"*News";
	label6.text = @"*Events";
	label7.text = @"*Videos";
	label8.text = @"*Food";
	label9.text = @"*Housing";
	label10.text = @"*Libraries";
	label11.text = @"*GSS";
	label12.text = @"*Emergency";
	UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Home"
								   style:UIBarButtonItemStyleBordered
								   target:nil
								   action:nil];
	self.navigationItem.backBarButtonItem = backbutton;
	[super viewDidLoad];
}

//==============================================================================
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
//==============================================================================
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
//==============================================================================
- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
//==============================================================================

- (void)dealloc 
{
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
	[button6 release];
	[button7 release];
	[button8 release];
	[label1 release];
	[label2 release];
	[label3 release];
	[label4 release];
	[label5 release];
	[label6 release];
	[label7 release];
	[label8 release]; 
    [super dealloc];
}

//==============================================================================
@end
