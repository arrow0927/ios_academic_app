#import "AboutViewController.h"

@implementation AboutViewController

@synthesize segControl;
@synthesize txtView;
@synthesize webView;
@synthesize mapView;
@synthesize aboutImage;
//==============================================================================
-(IBAction)segControlPressed:(id)sender
{
	if([sender selectedSegmentIndex] == 0)
	   {
		   webView.hidden = YES;
		   mapView.hidden = YES;
		   txtView.hidden = NO;
		   aboutImage.hidden = NO;
	   }
	else if([sender selectedSegmentIndex] == 1)
	   {
		   webView.hidden = NO;
		   mapView.hidden = YES;
		   txtView.hidden = YES;
		   aboutImage.hidden = YES;
	   }
	else
	   {
		   webView.hidden = YES;
		   mapView.hidden = NO;
		   txtView.hidden = YES;
		   aboutImage.hidden = YES;
	   }
	
}


//==============================================================================
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */
//==============================================================================
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	self.title = @"AboutViewController";
	//modufy text of back button
	UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]
								   initWithTitle:@"About"
									style:UIBarButtonItemStyleBordered
									target:self
									action:nil];
	self.navigationItem.backBarButtonItem = backbutton;
	
	
	//Add Bookmark button, which adds the page to bookmarks
	UIBarButtonItem *bookmarkbutton = [[UIBarButtonItem alloc] 
									   initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
																					target:self
																					action:nil];
	self.navigationItem.rightBarButtonItem = bookmarkbutton;
	
	//load webview
	NSURL *url = [NSURL URLWithString:@"http://www.cfis.ubc.ca/"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	webView.scalesPageToFit = YES;
	[webView loadRequest:request];
	
	//load mapview
	
	//load text view
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
- (void)dealloc {
    [super dealloc];
}
//==============================================================================

@end
