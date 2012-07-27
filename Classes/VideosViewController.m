#import "VideosViewController.h"

@implementation VideosViewController
@synthesize videos;
//==============================================================================
/*
 Information on how to embed YouTube Videos in your app 
 go to these URLs: google search key words:<<"youtube videos app iPhone">>
 http://apiblog.youtube.com/2009/02/youtube-apis-iphone-cool-mobile-apps.html
 
 http://iphoneincubator.com/blog/audio-video/how-to-play-youtube-videos-within-an-application
 
*/
//==============================================================================
/*
- (id)initWithStyle:(UITableViewStyle)style 
 {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/
//==============================================================================
- (void)viewDidLoad 
 {
	 [super viewDidLoad];
	 self.title = @"VideosViewController";
	 NSString *path = [[NSBundle mainBundle] pathForResource:@"videos" ofType:@"plist"];
	 NSMutableArray *tmpArray =
	 [[NSMutableArray alloc] initWithContentsOfFile:path ];
	 self.videos = tmpArray;
  //modify the text of the back button
  UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]
								 initWithTitle:@"List"
								 style:UIBarButtonItemStyleBordered
								 target:self
								 action:nil];
  self.navigationItem.backBarButtonItem = backbutton;
  
  
	 [tmpArray release];    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//==============================================================================
/*
- (void)viewWillAppear:(BOOL)animated 
 {
    [super viewWillAppear:animated];
}
*/
//==============================================================================
/*
- (void)viewDidAppear:(BOOL)animated 
 {
    [super viewDidAppear:animated];
}
*/
//==============================================================================
/*
- (void)viewWillDisappear:(BOOL)animated 
 {
	[super viewWillDisappear:animated];
}
*/
//==============================================================================
/*
- (void)viewDidDisappear:(BOOL)animated 
 {
	[super viewDidDisappear:animated];
}
*/
//==============================================================================
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
 {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
//==============================================================================
- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
//==============================================================================
- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
//==============================================================================
#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}
//==============================================================================
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [self.videos count];
}
//==============================================================================
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{

	static NSString *videoViewContCell = @"VideoViewContCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: videoViewContCell];
    if (cell == nil) 
	   {
		   
		   cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
										  reuseIdentifier: videoViewContCell] autorelease];
			
		}
    // Configure the cell
	cell.textLabel.text = [self.videos objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	 return cell;
	
}
//==============================================================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}
//==============================================================================
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
 {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
//==============================================================================
/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
 {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) 
	{
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) 
	{
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/
//==============================================================================
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath 
 {
}
*/
//==============================================================================
/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath 
 {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
//==============================================================================
- (void)dealloc 
{
    [super dealloc];
}
//==============================================================================

@end

