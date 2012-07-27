#import "CalendarTestViewController.h"

@implementation CalendarTestViewController
//==============================================================================
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
{
	if (self = [super initWithNibName:nibNameOrNil 
							   bundle:nibBundleOrNil]) 
{
	NSLog (@"Check this is the CalendarTestViewController");
	
	
	
 }
 return self;
 }


//==============================================================================
/*
- (void)loadView 
{
	[super loadView];
	//This instantiates a calendar view at the top half of the screen
	calendarView = [[[KLCalendarView alloc] initWithFrame:
					 CGRectMake(0.0f, 0.0f,  320.0f, 360) delegate:self] autorelease];
	//This instantiates a table view in the middle of the screen
	myTableView = [[UITableView alloc]initWithFrame:
				   CGRectMake(0,260,320,160) style:UITableViewStylePlain];
	
	myTableView.dataSource = self;
	myTableView.delegate = self;
	UIView *myHeaderView = [[UIView alloc] initWithFrame:
							CGRectMake(0,0,myTableView.frame.size.width , 20)];
	myHeaderView.backgroundColor = [UIColor blueColor];
	[myTableView setTableHeaderView:myHeaderView];
	
	
	[self.view addSubview:myTableView];
	[self.view addSubview:calendarView];
	[self.view bringSubviewToFront:myTableView];
	
}
 */
//==============================================================================
#pragma mark tableViewDelegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}
//==============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 5;
}
//==============================================================================
/*
 This is the initialization for for constructing the tableview that sits below the 
 Calendar
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	static NSString *MyIdentifier = @"MyIdentifier";
		
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) 
	   {
		   cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                         reuseIdentifier:MyIdentifier];
	   }
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	[cell.textLabel setText:@"No Data For Now"];
	
	return cell;
	
}
//==============================================================================
/*----- Calendar Delegates -----> */

- (void)calendarView:(KLCalendarView *)calendarView tappedTile:(KLTile *)aTile
{
	NSLog(@"Date Selected is %@",[aTile date]);
	[aTile flash];
	//*1 - Each tile has a tag number
	
	//*2 - Tapping the tile should result in fetching the data corresponding 
	//to the tag number from the events array
	
	
	//*3 - Next the cell in the table is updated with the data  from the array
	
	
	
	
	
	
	
	
	
	/*if(tile == nil)
	 tile = aTile;
	 else
	 [tile restoreBackgroundColor];*/
	//Write code here that needs to be implemented when calendar is tapped
	
}
//==============================================================================
- (KLTile *)calendarView:(KLCalendarView *)calendarView createTileForDate:(KLDate *)date
{
	
	CheckmarkTile *Tile = [[CheckmarkTile alloc] init];
	
	return Tile;
	
}
//==============================================================================
- (void)didChangeMonths
{
	
    UIView *clip = calendarView.superview;
    if (!clip)
        return;
    
    CGRect f = clip.frame;
    NSInteger weeks = [calendarView selectedMonthNumberOfWeeks];
    CGFloat adjustment = 0.f;
    
    switch (weeks) {
        case 4:
            adjustment = (92/321)*360+30;
            break;
        case 5:
            adjustment = (46/321)*360;
            break;
        case 6:
            adjustment = 0.f;
            break;
        default:
            break;
    }
    f.size.height = 360 - adjustment;
    clip.frame = f;
	
	CGRect f2 = CGRectMake(0,260-adjustment,320,160+adjustment);
	myTableView.frame = f2;
	[self.view bringSubviewToFront:myTableView];
	tile = nil;
}

//==============================================================================

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad 
{
	[super viewDidLoad];
	
	//This instantiates a calendar view at the top half of the screen
	calendarView = [[[KLCalendarView alloc] initWithFrame:
					 CGRectMake(0.0f, 0.0f,  320.0f, 360) delegate:self] autorelease];
	//This instantiates a table view in the middle of the screen
	myTableView = [[UITableView alloc]initWithFrame:
				   CGRectMake(0,260,320,160) style:UITableViewStylePlain];
	
	myTableView.dataSource = self;
	myTableView.delegate = self;
	UIView *myHeaderView = [[UIView alloc] initWithFrame:
							CGRectMake(0,0,myTableView.frame.size.width , 20)];
	myHeaderView.backgroundColor = [UIColor blueColor];
	[myTableView setTableHeaderView:myHeaderView];
	
	
	[self.view addSubview:myTableView];
	[self.view addSubview:calendarView];
	[self.view bringSubviewToFront:myTableView];
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
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

//==============================================================================
- (void)dealloc {
    [super dealloc];
}

@end
