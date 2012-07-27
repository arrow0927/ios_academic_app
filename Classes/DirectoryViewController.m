#import "DirectoryViewController.h"
#import "DirectoryDetailViewController.h"

@implementation DirectoryViewController
@synthesize names;
@synthesize keys;
@synthesize table;
@synthesize search;
@synthesize allNames;
@synthesize searchDisplayController;
//============================================================================
//============================================================================
#pragma mark -
#pragma mark Custom Methods
- (void)resetSearch 
{
    NSMutableDictionary *allNamesCopy = [self.allNames mutableDeepCopy];
    self.names = allNamesCopy;
	[allNamesCopy release];
    NSMutableArray *keyArray = [[NSMutableArray alloc] init];
    [keyArray addObject:UITableViewIndexSearch];//adds the search icon to array
    [keyArray addObjectsFromArray:[[self.allNames allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    self.keys = keyArray;
    [keyArray release];
}
//============================================================================
- (void)handleSearchForTerm:(NSString *)searchTerm
{
    NSMutableArray *sectionsToRemove = [[NSMutableArray alloc] init];
    [self resetSearch];
    
    for (NSString *key in self.keys) //loop 1 over all keys
	   {
		   NSMutableArray *array = [names valueForKey:key];
		   NSMutableArray *toRemove = [[NSMutableArray alloc] init];
		   for (NSString *name in array) //loop 2 over all names in array
			  {
				  if ([name rangeOfString:searchTerm options:NSCaseInsensitiveSearch].location == NSNotFound)
					  [toRemove addObject:name];
			  }
		   
		   if ([array count] == [toRemove count])
			   [sectionsToRemove addObject:key];
		   
		   [array removeObjectsInArray:toRemove];
		   [toRemove release];
	   }
    
	[self.keys removeObjectsInArray:sectionsToRemove];
    [sectionsToRemove release];
    [table reloadData];
}
//============================================================================
- (void)viewDidLoad 
{
	self.title = @"DirectoryViewController";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames"
                                                     ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.allNames = dict;
    [dict release];
    isSearching = NO;
	[search setShowsCancelButton:NO];//---------
	
	searchDisplayController = [[UISearchDisplayController alloc] 
							   initWithSearchBar:search 
							   contentsController:self];
	[self setSearchDisplayController:searchDisplayController];
	[searchDisplayController setDelegate:self];
	[searchDisplayController setSearchResultsDataSource:self];
	
	[search release];
	
    [self resetSearch];
    [table reloadData];
	
}
//============================================================================
- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.names = nil;
    self.keys = nil;
    self.table = nil;
    self.search = nil;
    self.allNames = nil;
}
//============================================================================
- (void)dealloc 
{
    [names release];
    [keys release];
    [table release];
    [search release];
    [allNames release];
    [super dealloc];
}
//============================================================================
//============================================================================
#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keys count];
    
}
//============================================================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([keys count] == 0)
        return 0;
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    return [nameSection count];
}
//============================================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *key = [keys objectAtIndex:section];
    NSArray *nameSection = [names objectForKey:key];
    
    static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SectionsTableIdentifier ];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:
				 UITableViewCellStyleDefault reuseIdentifier: 
				 SectionsTableIdentifier ] autorelease];
		
				cell.accessoryType = 
		UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [nameSection objectAtIndex:row];
    return cell;
}
//============================================================================
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([keys count] == 0)
        return nil;
	
    NSString *key = [keys objectAtIndex:section];
    if (key == UITableViewIndexSearch)
        return nil;
    
    return key;
}
//============================================================================
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
	//if ([self.searchDisplayController isActive]) 
	//	return nil;
	NSArray *tmpArray;
	tmpArray = [[NSArray alloc] init];
	if(isSearching == YES)
	   {
		   return tmpArray;
	   }
	return keys;
}
//============================================================================
/*- (void)reloadSectionIndexTitles
 {
 }
 
 
 */
//============================================================================
#pragma mark -
#pragma mark Table View Delegate Methods
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [search resignFirstResponder];
    search.text = @"";
    isSearching = NO;
    [tableView reloadData];
    return indexPath;
}
//============================================================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{

	DirectoryDetailViewController *ddVC = [[DirectoryDetailViewController alloc]
											  initWithNibName:@"DirectoryDetailViewController" 
											  bundle:nil];
	[self.navigationController pushViewController: ddVC animated: YES];
	//modify the text of the back button
	UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]
								   initWithTitle:@"List"
								   style:UIBarButtonItemStyleBordered
								   target:self
								   action:nil];
	self.navigationItem.backBarButtonItem = backbutton;
	
	
	
	
	[ddVC release];

}
//============================================================================
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSString *key = [keys objectAtIndex:index];
    if (key == UITableViewIndexSearch)
	   {
		   [tableView setContentOffset:CGPointZero animated:NO];
		   return NSNotFound;
	   }
    else return index;
    
}
//============================================================================
//============================================================================
#pragma mark -
#pragma mark Search Bar Delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchTerm = [searchBar text];
    [self handleSearchForTerm:searchTerm];
}
//============================================================================
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	isSearching = YES;
	//set index off here+++++++++++++++++++++++
	
	[self.table reloadSectionIndexTitles];
	[search setShowsCancelButton:YES];
}
//============================================================================
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchTerm
{
    if ([searchTerm length] == 0)
	   {
		   [self resetSearch];
		   
		   return;
	   }
    [self handleSearchForTerm:searchTerm];
    
}
//============================================================================
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    isSearching = NO;
	
    [self.table reloadSectionIndexTitles];
	search.text = @"";
	[search setShowsCancelButton:NO];//-------
	//[self resetSearch];
    
	//show index here++++++++++++++++++++++++
    
	[searchBar resignFirstResponder];
}

/*
//-----------------------------------------------------------------------------//
//-----------------------------------------------------------------------------//
//-----------------------------------------------------------------------------//
#import<Foundation/Foundation.h>
//Category for NSDictionary class

@interface NSDictionary(MutableDeepCopy)

-(NSMutableDictionary *)MutableDeepCopy;

@end

//-----------------------------------------------------------------------------//
#import "NSDictionary-MutableDeepCopy.h"
@implementation NSDictionary(DeepMutableCopy)


-(NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys)
	   {
		   id oneValue = [self valueForKey:key];
		   id oneCopy = nil;
		   
		   if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
			   oneCopy = [oneValue mutableDeepCopy];
		   else if ([oneValue respondsToSelector:@selector(mutableCopy)])
			   oneCopy = [oneValue mutableCopy];
		   if (oneCopy == nil)
			   oneCopy = [oneValue copy];
		   [ret setValue:oneCopy forKey:key];
	   }
    return ret;
}
 */
@end
