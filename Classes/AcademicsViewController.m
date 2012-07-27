#import "AcademicsViewController.h"
#import "AcademicSegmentedViewController.h"
@implementation AcademicsViewController
@synthesize departments;
@synthesize academics2;
@synthesize table;
@synthesize keys;
//=============================================================================
/*
 - (id)initWithStyle:(UITableViewStyle)style 
 {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 if (self = [super initWithStyle:style]) {
 }
 return self;
 }
 */
//=============================================================================
- (void)viewDidLoad 
{
    [super viewDidLoad];
	self.title = @"AcademicsViewController";
	
	UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]
								   initWithTitle:@"Programs"
								   style:UIBarButtonItemStyleBordered
								   target:nil
								   action:nil];
	self.navigationItem.backBarButtonItem = backbutton;
	
	
	//*********************
	/*
	 NSString *path = [[NSBundle mainBundle] pathForResource:@"academics" 
	 ofType:@"plist"];
	 NSMutableArray *tmpArray =
	 [[NSMutableArray alloc] initWithContentsOfFile:path ];
	 self.departments = tmpArray;
	 [tmpArray release];
	 */
	//*********************
	NSString *path2 = [[NSBundle mainBundle] pathForResource:@"academics2" 
													  ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path2];
	self.academics2 = dict;
	//academics2 is the dictionary that holds Keys(section headers) and 
	//values (the actual entities)
	[dict release];
	
	NSMutableArray *keyArray = [[NSMutableArray alloc] init];
	[keyArray addObjectsFromArray:[self.academics2 allKeys]];
	
	self.keys = keyArray;
	//keys is the array that holds all the keys
	[keyArray release];
	
	
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//=============================================================================
/*
 - (void)viewWillAppear:(BOOL)animated 
 {
 [super viewWillAppear:animated];
 }
 */
//=============================================================================
/*
 - (void)viewDidAppear:(BOOL)animated 
 {
 [super viewDidAppear:animated];
 }
 */
//=============================================================================
/*
 - (void)viewWillDisappear:(BOOL)animated 
 {
 [super viewWillDisappear:animated];
 }
 */
//=============================================================================
/*
 - (void)viewDidDisappear:(BOOL)animated 
 {
 [super viewDidDisappear:animated];
 }
 */
//=============================================================================
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */
//=============================================================================
- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}
//=============================================================================
- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
//=============================================================================
#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	//NSInteger numSections = [departments count];
    //return numSections;
	//	return 1;
	return [keys count];//------------
}
//=============================================================================
// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	//---------------
	if ([keys count] == 0)
        return 0;
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [academics2 objectForKey:key];
    return [nameSection count];
	//---------------------
	//return [departments count];
	
}
//=============================================================================
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	//-------------------
    NSUInteger section = [indexPath section];
    //NSUInteger row = [indexPath row];

    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [academics2 objectForKey:key];
	//-------------------------------
	
	static NSString *AcadViewContCell = @"AcadViewContCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             AcadViewContCell];
    if (cell == nil) 
	   {
		   cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
										  reuseIdentifier: AcadViewContCell] autorelease];
	   }
    // Configure the cell
	//    cell.textLabel.text = [self.departments objectAtIndex:indexPath.row];
	cell.textLabel.text = [nameSection objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	return cell;
}
//=============================================================================
//------------------------------------------
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([keys count] == 0)
        return nil;
	
    NSString *key = [keys objectAtIndex:section];
    if (key == UITableViewIndexSearch)
        return nil;
    
    return key;
}

//=============================================================================
/*
 - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
 {
 return keys;
 }
 
 //----------------------------------------------------
 */
//=============================================================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	
	
	//NSUInteger row  = [indexPath row];
	//NSUInteger sect = [indexPath section];
	AcademicSegmentedViewController *segVC = [[AcademicSegmentedViewController alloc]
											  initWithNibName:@"AcademicSegmentedViewController" 
											  bundle:nil];
	[self.navigationController pushViewController: segVC animated: YES];
	[segVC release];
	
	
	
	
	/*
	if(row == 0)
	   {
		   ProgramsViewController *pvc =[[ProgramsViewController alloc]
										 initWithNibName:@"ProgramsViewController" 
										 bundle:nil];
		   
		   [self.navigationController pushViewController:pvc animated:YES];
		   [pvc release];
	   }
	else
	   {
		   FacultiesViewController *fvc =[[FacultiesViewController alloc]
										  initWithNibName:@"FacultiesViewController" 
										  bundle:nil];
		   
		   [self.navigationController pushViewController:fvc animated:YES];
		   [fvc release];
	   }
	
	
	
	*/
	
}
//=============================================================================
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */
//=============================================================================
/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */
//=============================================================================
/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */
//=============================================================================
/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
//=============================================================================
- (void)dealloc 
{
    [super dealloc];
}
//=============================================================================

@end

/*--------------------------------------------------------------------------*/